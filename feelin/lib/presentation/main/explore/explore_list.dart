import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/explore/explore_bloc.dart';
import 'package:music_sns/domain/play/post.dart';

import 'feed_preview.dart';

class ExploreList extends StatefulWidget {
  //final bool hasNextPage;
  final bool isLast;
  final List<Post> feeds;
  final bool isLoading;
  final ScrollController scrollController;

  const ExploreList({Key? key,
    required this.isLast,
    required this.feeds,
    required this.isLoading,
    required this.scrollController}) : super(key: key);

  @override
  State<ExploreList> createState() => _PostListState();
}

class _PostListState extends State<ExploreList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return widget.feeds.isEmpty ?
            const Center(child: Text('아직 게시물이 없습니다.')) :
          ListView.builder(
            controller: widget.scrollController,
            itemCount: (widget.isLoading && !widget.isLast)
                ? widget.feeds.length + 1 : widget.feeds.length,
            itemBuilder: (context, index){
              if(index == widget.feeds.length){
                if(widget.isLoading) {
                  return const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: CupertinoActivityIndicator(radius: 18,),
                );
                } else {
                  return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Center(child: Text(
                    '모든 게시글을 불러왔습니다!',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )),
                );
                }
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, left: 8, right: 8),
                  child: FeedPreview(index: index, post: widget.feeds[index]),
                );
              }
            });
      }
    );
  }
}