import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/edit/edit_post_form/edit_post_form_bloc.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/application/share/share.dart';
import 'package:music_sns/domain/custom/marquee.dart';
import 'package:music_sns/domain/play/track.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_app_bar.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_list.dart';
import 'package:music_sns/presentation/main/playlist_info/track_item.dart';

import '../../../application/navigation/nav_bar_item.dart';
import '../../../application/navigation/navigation_cubit.dart';
import '../../../domain/play/post.dart';
import '../../edit/post/edit_post_page.dart';
import '../root_page.dart';

class PlaylistInfoPage extends StatefulWidget{
  const PlaylistInfoPage({Key? key, this.post, required this.postId, required this.heroNumber, required this.width}) : super(key: key);

  final Post? post;
  final int postId;
  final int heroNumber;
  final double width;

  @override
  State<PlaylistInfoPage> createState() => _PlaylistInfoPageState();
}

class _PlaylistInfoPageState extends State<PlaylistInfoPage> {

  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 378;
  double expandedHeight = 400;

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

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr, textScaleFactor: MediaQuery.of(context).textScaleFactor,)
      ..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width - 32);
    return textPainter.size;
  }
  double textHeight(String text, TextStyle style, double textWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: textWidth);

    final countLines = (textPainter.size.width / textWidth).ceil();
    final height = countLines * textPainter.size.height;
    return textPainter.size.height;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.loadRequest(widget.postId));
    setState((){
      expandedHeight = 350
          + textHeight(widget.post == null ? '': widget.post!.title, const TextStyle(fontSize: 24, fontWeight: FontWeight.w600,), widget.width-32)
          + textHeight(widget.post == null ? '': widget.post!.content, const TextStyle(fontWeight: FontWeight.w400, fontSize: 13,), widget.width-32);
      height = expandedHeight - 30;
    });
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistInfoBloc, PlaylistInfoState>(
      listener: (context, state){
        state.loadFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (post) => {
              setState((){
                    expandedHeight = 350
                        + textHeight(state.post.title, const TextStyle(fontSize: 24, fontWeight: FontWeight.w600,), MediaQuery.of(context).size.width-32)
                        + textHeight(state.post.content, const TextStyle(fontWeight: FontWeight.w400, fontSize: 13,), MediaQuery.of(context).size.width-32);
                    height = expandedHeight - 30;
                  }), print(textHeight(state.post.title, const TextStyle(fontSize: 24, fontWeight: FontWeight.w600,), MediaQuery.of(context).size.width-32)),
                  print(textHeight(state.post.content, const TextStyle(fontWeight: FontWeight.w400, fontSize: 13,), MediaQuery.of(context).size.width-32))
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
          return Stack(
            children: [
              Scaffold(
                          extendBodyBehindAppBar: true,
                          body: NestedScrollView(
                              controller: _scrollController,
                              headerSliverBuilder: (context, innerBoxIsScrolled){
                                return [
                                  PlaylistInfoAppBar(isShrink: _isShrink, post: widget.post ?? state.post, heroNumber: widget.heroNumber,
                                    goToTop: (){
                                    _scrollController!.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                  },
                                    expandedHeight: expandedHeight,
                                  ),
                                ];
                              },
                              body: const PlaylistInfoList(),
                          ),
                            floatingActionButton: Container(
                              width: 326,
                              height: 56,
                              child: FloatingActionButton.extended(
                                onPressed: (){},
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                hoverColor: Colors.transparent,
                                elevation: 0,
                                hoverElevation: 0,
                                focusElevation: 0,
                                highlightElevation: 0,
                                //shape: RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.circular(28)),
                                label: const Text('Save to account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),),
                            ),
                            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                        ),
              if(_isShrink)Positioned(
                  top: kToolbarHeight,
                  right: 15,
                  child: FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.heart_broken),
                  )),
            ],
          );
                    }
          )
      );
  }

}