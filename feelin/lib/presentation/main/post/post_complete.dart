import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../application/share/share.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../app/my_key_store.dart';
import '../../app/tab_item.dart';
import '../../style/colors.dart';
import '../playlist_info/playlist_info_page.dart';

class PostCompletePage extends StatelessWidget{
  final Post post;
  final int globalContext;
  const PostCompletePage({Key? key, required this.post, required this.globalContext}) : super(key: key);

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
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios_new),),
        title: const Text('New post',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              shadowColor: Colors.black,
              elevation: 8,
              child: Image(
                image: CachedNetworkImageProvider(post.playlist.thumbnail!),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30,),
            Text(post.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            button(screenSize, FeelinColorFamily.gray900, Colors.white, (){
              share.share(post.id, post.title, post.playlist.thumbnail!);
            }, 'Share Playlist'),
            const SizedBox(height: 10,),
            button(screenSize, FeelinColorFamily.gray50, Colors.black, (){
              Navigator.pop(context);
              final GlobalKey<NavigatorState> navigatorKey = globalContext == 0 ? MyKeyStore.appKey.currentState!.navigatorKeys[TabItem.home]!: MyKeyStore.appKey.currentState!.navigatorKeys[TabItem.profile]!;
              navigatorKey.currentState!.push(
                CupertinoPageRoute(
                builder: (context){
                  return BlocProvider(
                      create: (context) => getIt<PlaylistInfoBloc>()..add(PlaylistInfoEvent.loadRequest(post.id)),
                      child: PlaylistInfoPage(post: post, postId: post.id, heroNumber: 0, width: MediaQuery.of(context).size.width,));
                },
              ),
              );
            }, 'Go to Post'),
            const SizedBox(height: 40,),
          ],
        ),
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