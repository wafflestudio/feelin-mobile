import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_sns/domain/profile/profile.dart';

import 'follow_user_item.dart';

class FollowList extends StatefulWidget {
  //final bool hasNextPage;
  final bool isLast;
  final List<Profile> users;
  final bool isLoading;
  final ScrollController scrollController;

  const FollowList({Key? key,
    required this.isLast,
    required this.users,
    required this.isLoading,
    required this.scrollController}) : super(key: key);

  @override
  State<FollowList> createState() => _PostListState();
}

class _PostListState extends State<FollowList> {
  @override
  Widget build(BuildContext context) {
    return widget.users.isEmpty ?
    const Center(child: Text('No user.')) :
    ListView.builder(
        controller: widget.scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: (widget.isLoading && !widget.isLast)
            ? widget.users.length + 1 : widget.users.length,
        itemBuilder: (context, index) {
          if (index == widget.users.length) {
            if (widget.isLoading) {
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
              child: FollowUserItem(index: index, profile: widget.users[index]),
            );
          }
        });
  }
}