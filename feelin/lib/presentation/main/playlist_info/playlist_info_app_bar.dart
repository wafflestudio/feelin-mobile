import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../application/edit/edit_post_form/edit_post_form_bloc.dart';
import '../../../application/share/share.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../edit/post/edit_post_page.dart';

class PlaylistInfoAppBar extends StatefulWidget with PreferredSizeWidget {
  final bool isShrink;
  final Post post;
  final int heroNumber;
  final Function goToTop;
  final double expandedHeight;

  const PlaylistInfoAppBar(
      {Key? key, required this.isShrink, required this.post, required this.heroNumber, required this.goToTop, required this.expandedHeight}) : super(key: key);

  @override
  State<PlaylistInfoAppBar> createState() => _PlaylistInfoAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}

class _PlaylistInfoAppBarState extends State<PlaylistInfoAppBar> {

  final GlobalKey imageKey = GlobalKey();
  late PaletteGenerator paletteGenerator;
  Color imageColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.post.playlist.thumbnail ?? context.read<PlaylistInfoBloc>().state.post.playlist.tracks![0].album.thumbnail),
    );

    setState(() {
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

    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
      builder: (context, state) {
        return SliverAppBar(
          elevation: 0,
          pinned: true,
          expandedHeight: widget.expandedHeight,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
                        end: const FractionalOffset(0.5, 0.6),
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
                  bottom: 0,
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
                      color: state.isLiked ? Colors.red : Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
              )
            ],
          ),
          actions: widget.isShrink
              ? null : [IconButton(onPressed: (){
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton(onPressed: (){
                          share.share(widget.post.id, widget.post.title, widget.post.playlist.thumbnail ?? state.post.playlist.tracks![0].album.thumbnail);
                        }, child: const Text('공유하기', textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 16),)),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            Navigator.push(context,
                                CupertinoPageRoute(
                                    builder: (context) => BlocProvider(create: (context) => getIt<EditPostFormBloc>(),
                                      child: EditPostPage(post: widget.post.clone(),),
                                    ))
                            );
                          }, child: const Text('수정하기', style: TextStyle(color: Colors.black, fontSize: 16),))),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.deleteRequest(widget.post.id));
                            Navigator.pop(context);
                          }, child: const Text('삭제하기', style: TextStyle(color: Colors.red, fontSize: 16),))),
                    ],
                  ),
                );
              },
            ).then((value) {  });
          }, icon: const Icon(Icons.more_vert))],
        );
      }
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
                  color: isDark(imageColor) ? Colors.white : Colors.black
            ),
          ),
                ),
              )
              : null,
          background: SafeArea(
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
                        image: CachedNetworkImageProvider(widget.post.playlist.thumbnail ?? state.post.playlist.tracks![0].album.thumbnail),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          widget.post.content,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: FeelinColorFamily.gray600,
                          ),
                        ),
                      ),
                      if(!state.isLoading)UserNickname(writer: state.post.writer!),
                      if(!state.isLoading)Row(
                        children: [
                          Text(
                            "${state.post.playlist.tracks!.length} tracks | ${state.post.likeCount!} likes |",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: FeelinColorFamily.gray700,
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                share.share(widget.post.id, widget.post.title, widget.post.playlist.thumbnail ?? state.post.playlist.tracks![0].album.thumbnail);
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
        );
      }
    );
  }
}