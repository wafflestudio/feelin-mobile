import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/streaming/vendor.dart';
import 'package:music_sns/presentation/main/post/app/post_app_bar.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../domain/custom/marquee.dart';
import 'post_detail_page.dart';

class PostTrackPage extends StatefulWidget{
  final int globalContext;
  const PostTrackPage({Key? key, required this.globalContext}) : super(key: key);

  @override
  State<PostTrackPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostTrackPage> {
  final _formKey = GlobalKey<FormState>();
  late Playlist playlist;


  @override
  void initState(){
    super.initState();
    playlist = context.read<PostFormBloc>().state.playlist;
    final preview = playlist.playlistPreview!;
    preview.length = playlist.tracks!.length;
    preview.order = List.generate(preview.length, (index) => index+1).join(' ');
    context.read<PostFormBloc>().add(PostFormEvent.playlistPreviewChanged(playlist.playlistPreview!));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Scaffold(
      appBar: PostAppBar(currPage: 2, goToNext: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context2){
            return BlocProvider.value(
                value: context.read<PostFormBloc>(),
                child: PostDetailPage(globalContext: widget.globalContext));
          },
        ),
        );
      },),
      body: _postDetailForm(screenSize),
    );
  }

  Widget _postDetailForm(Size size){
    final ScrollController scrollController = ScrollController();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  context.read<PostFormBloc>().state.playlistPreview.thumbnail,
                  fit: BoxFit.cover,
                  width: 72,
                  height: 72,),
                const SizedBox(width: 10,),
                SizedBox(
                  width: size.width - 122,
                  child: Column(
                    children: [
                      if (playlist.originalVendorPlaylist != null) SizedBox(
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Image.asset(
                                Vendor.strToVendor(playlist.originalVendorPlaylist!.vendor) ==
                                        Vendor.spotify
                                    ? 'assets/logos/spotify_logo.png'
                                    : 'assets/logos/apple_music_logo.png',
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      Text(
                        playlist.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    itemCount: playlist.tracks!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        key: ValueKey(index),
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image(
                              image: playlist.tracks![index].album.thumbnail == null ? const AssetImage('assets/images/cover_default.png') as ImageProvider : CachedNetworkImageProvider(playlist.tracks![index].album.thumbnail!),
                              fit: BoxFit.cover,
                              width: 56,
                              height: 56,),
                            _itemText(context, index),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemText(context, int index) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 35,
      width: MediaQuery.of(context).size.width - 110,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Marquee(
              child: Text(playlist.tracks![index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Marquee(
              direction: Axis.horizontal,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: playlist.tracks![index].artists.length,
                itemBuilder: (context, index2){
                  return Text(
                    playlist.tracks![index].artists[index2].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: FeelinColorFamily.grayscaleGray2,
                        fontSize: 12
                    ),
                  );
                },
                separatorBuilder: (context, index2) => Text(
                  ", ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: FeelinColorFamily.grayscaleGray2,
                      fontSize: 12
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
