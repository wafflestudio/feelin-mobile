import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../application/share/share.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../style/colors.dart';
import '../playlist_info/playlist_info_page.dart';

class PostCompletePage extends StatelessWidget{
  final Post post;
  const PostCompletePage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;
    final share = Share(context: context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
        title: const Text('New post',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: CachedNetworkImageProvider(post.tempThumbnail!),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          Text(post.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          button(screenSize, FeelinColorFamily.gray900, Colors.white, (){
            share.share(post.id, post.title, post.tempThumbnail!);
          }, 'Share Playlist'),
          button(screenSize, FeelinColorFamily.gray50, Colors.black, (){
            Navigator.pushReplacement(context, CupertinoPageRoute(
              builder: (context){
                return BlocProvider(
                    create: (context) => getIt<PlaylistInfoBloc>(),
                    child: PlaylistInfoPage(post: null, postId: post.id, heroNumber: 0, width: MediaQuery.of(context).size.width,));
              },
            ),
            );
          }, 'Go to Post')

        ],
      ),
    );
  }

  Widget button(Size size, Color backgroundColor, Color textColor, Function function, String text){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: FeelinColorFamily.gray900, ),
        color: backgroundColor,
      ),
      width: size.width-72,
      height: 56,
      child: ElevatedButton(
        onPressed: ()=> function(),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(Colors.transparent)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        ),
      ),
    );
  }
}