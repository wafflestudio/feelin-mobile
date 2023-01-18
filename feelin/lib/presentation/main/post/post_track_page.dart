import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../domain/custom/marquee.dart';
import '../../common/next_button.dart';

class PostTrackPage extends StatefulWidget{
  final Function goToNext;
  const PostTrackPage({Key? key, required this.goToNext}) : super(key: key);

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

    return Container(
      child: _postDetailForm(screenSize),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    context.read<PostFormBloc>().state.playlistPreview.thumbnail,
                    fit: BoxFit.cover,
                    width: 72,
                    height: 72,),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: size.width - 122,
                  child: Text(
                      playlist.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                  ),
                ),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image(
                                image: CachedNetworkImageProvider(
                                    playlist.tracks![index].album.thumbnail),
                                fit: BoxFit.cover,
                                width: 56,
                                height: 56,),
                            ),
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