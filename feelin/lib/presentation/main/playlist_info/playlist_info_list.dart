import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';

import 'track_item.dart';

class PlaylistInfoList extends StatefulWidget {

  const PlaylistInfoList({Key? key,}) : super(key: key);

  @override
  State<PlaylistInfoList> createState() => _PostListState();
}

class _PostListState extends State<PlaylistInfoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return TrackItem(index: index, post: state.post);
                }, childCount: state.post.playlist.tracks!.length,
              ),)
              // ListView.builder(
              //     physics: const ClampingScrollPhysics(),
              //     itemCount: state.post.playlist.tracks!.length,
              //     itemBuilder: (context, index){
              //       return TrackItem(index: index, post: state.post);
              //     }),
            ),
          );
        }
    );
  }
}