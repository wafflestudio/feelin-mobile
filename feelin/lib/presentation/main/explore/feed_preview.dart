import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_page.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';

class FeedPreview extends StatelessWidget {
  final int index;
  final Post post;

  const FeedPreview({Key? key, required this.index, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context){
            return BlocProvider(
                create: (context) => getIt<PlaylistInfoBloc>(),
                child: PlaylistInfoPage(post: post, postId: post.id, heroNumber: index, width: MediaQuery.of(context).size.width,));
          },
        ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: FeelinColorFamily.gray50,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 11, 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 178,
                height: 178,
                child: Hero(
                  tag: "playlistCover$index",
                  child: Image(
                    image: CachedNetworkImageProvider(
                        post.playlist.thumbnail!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 14,),
              SizedBox(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserNickname(writer: post.writer!, isSmall: true,),
                          SizedBox(
                            width: 150,
                            child: Text(
                                post.title,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                        child: SizedBox(
                          width: 150,
                          child: Text(
                              post.content,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: FeelinColorFamily.gray600,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}