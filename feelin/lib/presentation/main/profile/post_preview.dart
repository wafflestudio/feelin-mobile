import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/streaming/vendor.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../injection.dart';
import '../playlist_info/playlist_info_page.dart';

class PostPreview extends StatefulWidget {
  final int index;
  final Post post;
  final Function? deleteItem;

  const PostPreview({Key? key, required this.index, required this.post, this.deleteItem}) : super(key: key);

  @override
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {

  late String heroTag;
  @override
  void initState() {
    super.initState();
    heroTag = getRandomString(20);
  }

  String getRandomString(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context,){
            return BlocProvider(
                create: (context) => getIt<PlaylistInfoBloc>()..add(PlaylistInfoEvent.loadRequest(widget.post.id)),
                child: PlaylistInfoPage(post: widget.post, postId: widget.post.id, heroTag: heroTag, width: MediaQuery.of(context).size.width,
                deleteItem: widget.deleteItem,
                ));
          },
        ),
        ).then((value) {
          if (value != null) {
            setState(() {
              widget.post.title = value.title;
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
                tag: "playlistCover$heroTag",
                child: Image(
                  image: widget.post.playlist.thumbnail == null ? const AssetImage('assets/images/cover_default.png') as ImageProvider : CachedNetworkImageProvider(widget.post.playlist.thumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if(widget.post.playlist.originalVendorPlaylist != null) SizedBox(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Image.asset(
                          Vendor.strToVendor(widget.post.playlist.originalVendorPlaylist!.vendor) == Vendor.spotify ? 'assets/logos/spotify_logo.png' : 'assets/logos/apple_music_logo.png',
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
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
                    width: MediaQuery.of(context).size.width - 150,
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
