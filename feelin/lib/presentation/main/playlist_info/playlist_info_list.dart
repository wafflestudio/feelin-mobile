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
            sliver: SliverList(delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if(index == state.post.playlist.tracks!.length-1){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 66),
                        child: TrackItem(index: index, post: state.post),
                      );
                    }
                    return TrackItem(index: index, post: state.post);
              }, childCount: state.post.playlist.tracks!.length,
            ),),
          );
        }
    );
  }
}