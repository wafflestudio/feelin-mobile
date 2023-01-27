import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/presentation/app/app.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../injection.dart';
import '../playlist_info/playlist_info_page.dart';

class PostPreview extends StatefulWidget {
  final int index;
  final Post post;

  const PostPreview({Key? key, required this.index, required this.post}) : super(key: key);

  @override
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context){
            return BlocProvider(
                create: (context) => getIt<PlaylistInfoBloc>(),
                child: PlaylistInfoPage(post: widget.post, postId: widget.post.id, heroNumber: widget.index, width: MediaQuery.of(context).size.width,));
          },
        ),
        ).then((value) {
          if(value != null){
            setState(() {
              widget.post.title = value.reportType;
              widget.post.content = value.content;
            });
        }});
      },
      child: AbsorbPointer(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Hero(
                tag: "playlistCover${widget.index}",
                child: Image(
                  image: CachedNetworkImageProvider(
                      widget.post.playlist.thumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-150,
                    child: Text(
                      widget.post.title,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-150,
                    child: Text(
                      widget.post.content,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: FeelinColorFamily.gray700,
                        letterSpacing: -0.41,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}