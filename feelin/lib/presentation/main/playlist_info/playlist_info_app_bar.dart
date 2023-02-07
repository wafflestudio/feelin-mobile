import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/edit/edit_post_form/edit_post_form_bloc.dart';
import '../../../application/follow/follow_bloc.dart';
import '../../../application/share/share.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../edit/post/edit_post_page.dart';
import '../../follow/follow_page.dart';
import '../profile/report_result_modal.dart';
import 'report_bottom_modal.dart';

class PlaylistInfoAppBar extends StatefulWidget with PreferredSizeWidget {
  final bool isShrink;
  final Post post;
  final int heroNumber;
  final Function goToTop;
  final double expandedHeight;
  final Function edit;
  final bool isEdited;
  final Function? deleteItem;

  const PlaylistInfoAppBar(
      {Key? key, required this.isShrink, required this.post, required this.heroNumber, required this.goToTop, required this.expandedHeight, required this.edit, required this.isEdited, this.deleteItem}) : super(key: key);

  @override
  State<PlaylistInfoAppBar> createState() => _PlaylistInfoAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}

class _PlaylistInfoAppBarState extends State<PlaylistInfoAppBar> {

  final GlobalKey imageKey = GlobalKey();
  final storage = const FlutterSecureStorage();
  late PaletteGenerator paletteGenerator;
  Color imageColor = Colors.white;


  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.post.playlist.thumbnail ?? context.watch<PlaylistInfoBloc>().state.post.playlist.thumbnail!),
    );

    setState(() {
      //imageColor = paletteGenerator.lightVibrantColor != null ? paletteGenerator.lightVibrantColor!.color : paletteGenerator.dominantColor!.color;
      imageColor = paletteGenerator.dominantColor!.color;
    });
  }

  bool isDark(Color color) {
    final grayScale = color.red*0.299 + color.blue*0.114 + color.green*0.587;
    return grayScale <= 128;
  }

  @override
  Widget build(BuildContext context) {

    final share = Share(context: context);

    return BlocListener<PlaylistInfoBloc, PlaylistInfoState>(
      listener: (context, state){
        state.loadFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (post) {
              widget.post.title = post.title;
              widget.post.content = post.content;
              context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.resetStateRequest());
            },
          ),
        );
        state.reportFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) {failureOrSuccess.fold(
                  (f) => null,
                  (_) {showModalBottomSheet<void>(
                  context: context,
                  useRootNavigator: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => ReportResultBottomModal(username: state.post.writer!.username, function: (){
                    showBlockModal(context);
                  })
              );
              },
            );
            context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.resetStateRequest());
            }
        );
        state.blockFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) { failureOrSuccess.fold(
                (f) => f.maybeMap(
              alreadyBlocked: (_)=>showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                    backgroundColor: FeelinColorFamily.errorPrimary,
                    icon: const Icon(Icons.music_note, color: Colors.transparent,),
                    message: 'You have already blocked this user.'),
              ),
              orElse: ()=>showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                    backgroundColor: FeelinColorFamily.errorPrimary,
                    icon: const Icon(Icons.music_note, color: Colors.transparent,),
                    message: 'Server Error'),
              ),
            ),
                (_) => showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(message: '${state.post.writer!.username} has been blocked. You can unblock this user in the settings.'),
            ),
          );
          context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.resetStateRequest());
          },
        );
      },
      child: BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
          return SliverAppBar(
            elevation: 0,
            pinned: true,
            expandedHeight: widget.expandedHeight,
            leading: IconButton(
              onPressed: () {
                if(widget.isEdited){
                  if(widget.post != null){
                    widget.post.isLiked = state.post.isLiked;
                  }
                  Navigator.pop(context, widget.post);
                }else{
                  Navigator.pop(context);
                }
              },
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: widget.isShrink
                      ? BoxDecoration(color: imageColor)
                      : BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: FractionalOffset(0.5, 250 / widget.expandedHeight),
                          colors: <Color>[
                            imageColor,
                            Colors.white,
                          ],
                          stops: const <double>[0.0, 1.0],
                          tileMode: TileMode.clamp
                      )
                  ),
                  child: flexibleSpaceBar(share),
                ),
                if(!widget.isShrink)Positioned(
                  right: 15,
                    bottom: 16,
                    child: FloatingActionButton(
                      onPressed: (){
                        if(!state.isLiked){
                          context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.likeRequest());
                        }else{
                          context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.unlikeRequest());
                        }
                      },
                      backgroundColor: Colors.black,
                      //foregroundColor: Colors.white,
                      child: SvgPicture.asset(
                        state.isLiked ? 'assets/icons/heart_filled.svg'
                            : 'assets/icons/heart.svg',
                        color: state.isLiked ? FeelinColorFamily.redPrimary : Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                )
              ],
            ),
            actions: (widget.isShrink || state.isLoading)
                ? null : [IconButton(onPressed: (){
                  PlaylistInfoBloc bloc = context.read<PlaylistInfoBloc>();
              showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context2) {
                  return SizedBox(
                    height: (state.post.writer!.id == context.watch<AuthBloc>().state.id) ? (Platform.isIOS ? 260 : 230) : (Platform.isIOS ? 200 : 170),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            share.share(widget.post.id, widget.post.title, widget.post.playlist.thumbnail ?? state.post.playlist.thumbnail!);
                            Navigator.pop(context2);
                          }, child: const Text('Share', textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 16),)),
                        ),
                        if(state.post.writer!.id == context.watch<AuthBloc>().state.id) SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: TextButton(onPressed: (){
                              Navigator.pop(context2);
                              Navigator.push(context,
                                  CupertinoPageRoute(
                                      builder: (context) => BlocProvider(create: (context) => getIt<EditPostFormBloc>(),
                                        child: EditPostPage(post: state.post.clone(),),
                                      ))
                              ).then((value) {
                                if(value != null){
                                  bloc.add(PlaylistInfoEvent.loadRequest(widget.post.id));
                                  widget.edit();
                                }
                              });
                            }, child: const Text('Edit', style: TextStyle(color: Colors.black, fontSize: 16),))),
                        if(state.post.writer!.id == context.watch<AuthBloc>().state.id) SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: TextButton(onPressed: ()=>showModalBottomSheet<void>(
                              context: context,
                              useRootNavigator: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Delete Post',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 26),
                                              alignment: Alignment.centerRight,
                                            ),
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Center(
                                          child: Text(
                                            'Are you sure you want to delete the post?',
                                            style: TextStyle(fontSize: 14, ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: (){
                                            bloc.add(PlaylistInfoEvent.deleteRequest(widget.post.id));
                                            if(widget.deleteItem != null){
                                              widget.deleteItem!();
                                            }
                                            Navigator.pop(context2);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                , child: Text('Delete', style: TextStyle(color: FeelinColorFamily.errorDark, fontSize: 16),))),
                        if(state.post.writer!.id != context.watch<AuthBloc>().state.id) SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: TextButton(onPressed: (){
                              Navigator.pop(context2);
                              showModalBottomSheet<void>(
                              context: context,
                              useRootNavigator: true,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (context2) {
                                return BlocProvider.value(
                                    value: context.read<PlaylistInfoBloc>(),
                                    child: const ReportBottomModal());
                                },
                            );
                              }
                  , child: Text('Report', style: TextStyle(color: FeelinColorFamily.errorDark, fontSize: 16),))),
                      ],
                    ),
                  );
                },
              ).then((value) {  });
            }, icon: const Icon(Icons.more_vert))],
          );
        }
      ),
    );
  }

  Widget flexibleSpaceBar(Share share){
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
        return (state.isLoading && widget.post.playlist.thumbnail == null)
            ? const CupertinoActivityIndicator(radius: 18,)
            : FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          centerTitle: true,
          title: widget.isShrink
              ? GestureDetector(
            onTap: ()=> widget.goToTop(),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Text(
            widget.post.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: -0.41,
                  color: isDark(imageColor) ? Colors.white : Colors.black
            ),
          ),
                ),
              )
              : null,
          background: SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  if(widget.post.playlist.thumbnail != null || !state.isLoading)Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Material(
                      shadowColor: Colors.black,
                      elevation: 8,
                      child: Hero(
                        tag: "playlistCover${widget.heroNumber}",
                        child: Image(
                          image: CachedNetworkImageProvider(widget.post.playlist.thumbnail ?? state.post.playlist.thumbnail!),
                          width: 233,
                          height: 233,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDetail();
                          },
                          child: AbsorbPointer(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width-32,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.post.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      widget.post.content,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: FeelinColorFamily.gray600,
                                        letterSpacing: -0.41,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        if(!state.isLoading)UserNickname(profile: state.post.writer!),
                        if(!state.isLoading)Row(
                          children: [
                            Text(
                              "${state.post.playlist.tracks!.length} tracks | ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: FeelinColorFamily.gray700,
                                letterSpacing: -0.41,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(
                                  builder: (context){
                                    return BlocProvider(
                                        create: (context) => getIt<FollowBloc>(),
                                        child: FollowPage(id: state.post.id, isFollowerPage: true, isLikesPage: true));
                                  },
                                ),
                                );
                              },
                              child: Text(
                                "${state.post.likeCount!} likes |",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: FeelinColorFamily.gray700,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  share.share(widget.post.id, widget.post.title, widget.post.playlist.thumbnail ?? state.post.playlist.thumbnail!);
                                },
                                icon: Icon(Icons.ios_share, size: 27,color: FeelinColorFamily.gray700,))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void showDetail(){
    final state = context.read<PlaylistInfoBloc>().state;
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 345,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 100,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: FeelinColorFamily.gray600,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  UserNickname(profile: state.post.writer!),
                  const SizedBox(height: 5,),
                  Text(
                    widget.post.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.post.content,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: FeelinColorFamily.gray900,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showBlockModal(context2){
    showModalBottomSheet<void>(
      context: context2,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context2) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Block User',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(30, 26),
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () => Navigator.of(context2).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Are you sure you want to block the user?',
                    style: TextStyle(fontSize: 14, ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: (){
                    context.read<PlaylistInfoBloc>().add(const PlaylistInfoEvent.blockRequest());
                    Navigator.pop(context2);
                  },
                  child: Text(
                    'Block',
                    style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}