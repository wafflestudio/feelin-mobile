import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_app_bar.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_list.dart';

import '../../../domain/play/post.dart';
import '../../common/restricted_page.dart';
import '../../style/colors.dart';
import 'save_to_account_button.dart';

class PlaylistInfoPage extends StatefulWidget{
  const PlaylistInfoPage({Key? key, this.post, required this.postId, required this.heroNumber, required this.width, this.deleteItem}) : super(key: key);

  final Post? post;
  final String postId;
  final int heroNumber;
  final double width;
  final Function? deleteItem;

  @override
  State<PlaylistInfoPage> createState() => _PlaylistInfoPageState();
}

class _PlaylistInfoPageState extends State<PlaylistInfoPage> {

  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 378;
  double expandedHeight = 400;
  bool isEdited = true;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset >= (height - kToolbarHeight);
  }

  Size _textSize(String text, TextStyle style, {bool scaleFactor = false}) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 2, textDirection: TextDirection.ltr, textScaleFactor: scaleFactor ? MediaQuery.of(context).textScaleFactor : 1.0,)
      ..layout(minWidth: 0, maxWidth: widget.width-32);
    return textPainter.size;
  }

  double textHeight(String text, TextStyle style, double textWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: textWidth);

    final countLines = (textPainter.size.width / textWidth).ceil();
    return textPainter.size.height;
  }
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.loadRequest(widget.postId));
    setState((){
      expandedHeight = 350
          + _textSize(widget.post == null ? '': widget.post!.title, const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.41,
              fontFamily: 'Pretendard'
          ),).height
          + _textSize(widget.post == null ? '': widget.post!.content, const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: -0.41,
              fontFamily: 'Pretendard'
          )).height;
      height = expandedHeight - 16;
    });
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  bool firstLoaded = false;

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: (){
        if(firstLoaded){
          context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.reloadRequest(widget.postId));
        }else{
          firstLoaded = true;
        }
      },
      child: BlocListener<PlaylistInfoBloc, PlaylistInfoState>(
        listener: (context, state){
          state.loadFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => f.maybeMap(
                    notFound: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: FeelinColorFamily.errorPrimary,
                        content: const Text("This post has been deleted."),
                      ));
                      Navigator.pop(context);
                      }
                  ,orElse: () => null,
                ),
                  (post) => {
                setState((){
                      expandedHeight = 350
                          + _textSize(state.post.title, const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.41,
                              fontFamily: 'Pretendard'
                          ), scaleFactor: true).height
                          + _textSize(state.post.content, const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: -0.41,
                              fontFamily: 'Pretendard'
                          ), scaleFactor: true).height;
                      height = expandedHeight - 16 - (AppBar().preferredSize.height - 28);
                    }),
              },
            ),
          );
          state.deleteFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => null,
                  (unit) => {
                Navigator.pop(context),
              },
            ),
          );
        },
        child: BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
          builder: (context, state) {
            return state.isRestricted ? const RestrictedPage() : Stack(
              children: [
                WillPopScope(
                  onWillPop: () async {
                    if(isEdited && widget.post != null){
                      setState(() {
                        widget.post!.isLiked = state.isLiked;
                        widget.post!.likeCount = state.post.likeCount;
                      });
                      Navigator.pop(context, widget.post);
                      return false;
                    }else{
                      return true;
                    }
                  },
                  child: Scaffold(
                              extendBodyBehindAppBar: true,
                              body: ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(),
                                child: CustomScrollView(
                                    controller: _scrollController,
                                    physics: const BouncingScrollPhysics(),
                                  slivers: [
                                    if(widget.post != null || !state.isLoading) PlaylistInfoAppBar(isShrink: _isShrink, post: widget.post ?? state.post, heroNumber: widget.heroNumber,
                                      goToTop: (){
                                        _scrollController!.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                      },
                                      expandedHeight: expandedHeight,
                                      edit: (){
                                        setState(() {
                                          isEdited = true;
                                        });
                                      },
                                      isEdited: isEdited,
                                      deleteItem: widget.deleteItem,
                                    ),
                                    const PlaylistInfoList()
                                  ],
                                ),
                              ),
                                floatingActionButton: const SaveToAccountButton(),
                                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                            ),
                ),
                if(_isShrink)Positioned(
                    top: MediaQuery.of(context).padding.top + kToolbarHeight - 28,
                    right: 15,
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
                ),
              ],
            );
                      }
            )
        ),
    );
  }

}