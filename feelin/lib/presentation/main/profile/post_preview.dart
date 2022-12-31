import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../injection.dart';
import '../explore/playlist_info_page.dart';

class PostPreview extends StatelessWidget {
  final int index;
  final Post post;

  const PostPreview({Key? key, required this.index, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context){
            return BlocProvider(
                create: (context) => getIt<PlaylistInfoBloc>(),
                child: PlaylistInfoPage(post: post, postId: post.id, heroNumber: index,));
          },
        ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: FeelinColorFamily.grayBorder, width: 0.5)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: "playlistCover$index",
                  child: Image(
                    image: CachedNetworkImageProvider(
                        post.playlist.thumbnail!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 36,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Text(
                    post.title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}