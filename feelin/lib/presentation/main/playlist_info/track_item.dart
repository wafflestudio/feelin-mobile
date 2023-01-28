import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../domain/custom/marquee.dart';
import '../../../domain/play/post.dart';
import '../../../domain/play/track.dart';

class TrackItem extends StatelessWidget {
  final int index;
  final Post post;

  const TrackItem({Key? key, required this.index, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Image(
              image: CachedNetworkImageProvider(
                  post.playlist.tracks![index].album.thumbnail),
              fit: BoxFit.cover,
              width: 52,
              height: 52,),
            _itemText(context, index),
          ],
        ),
      ),
    );
  }

  Widget _itemText(context, int index) {
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.centerLeft,
            height: 52,
            width: MediaQuery
                .of(context)
                .size
                .width - 95,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Marquee(
                        child: Text(state.post.playlist.tracks![index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Marquee(
                      direction: Axis.horizontal,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.post.playlist.tracks![index].artists.length,
                        itemBuilder: (context, index2) {
                          return Text(
                            state.post.playlist.tracks![index].artists[index2].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: FeelinColorFamily.gray700,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.41,
                            ),
                          );
                        },
                        separatorBuilder: (context, index2) =>
                        const Text(
                          ", ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff7077D5),
                              fontSize: 12,
                              letterSpacing: -0.41,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
    );
  }

  void showPopup(context, List<Track> tracks, index) {
    showDialog(context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.black12,
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7 + 50,
              child: PageView.builder(
                controller: PageController(initialPage: index,
                  //viewportFraction: 0.8,
                ),
                itemCount: tracks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Image(
                          image: CachedNetworkImageProvider(tracks[index].album.thumbnail),
                          fit: BoxFit.cover,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.6,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.6),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Marquee(
                                direction: Axis.horizontal,
                                child: Text(tracks[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xff00C19C),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Marquee(
                                    direction: Axis.horizontal,
                                    child: ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: tracks[index].artists.length,
                                      itemBuilder: (context, index2){
                                        return Text(
                                          tracks[index].artists[index2].name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Color(0xff7077D5),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index2) => const Text(
                                        " & ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0xff7077D5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: 300,
                          height: 30,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(1.0, 1.0),
                                  colors: <Color>[
                                    Color(0xff00C19C),
                                    Color(0xff7077D5),
                                  ],
                                  stops: <double>[0.0, 1.0],
                                  tileMode: TileMode.clamp
                              )
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: OutlinedButton(
                                onPressed: () {
                                  //choosePlatform(context);
                                }
                                //TODO: implement to store a track.
                                ,
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        const ContinuousRectangleBorder()),
                                    foregroundColor: MaterialStateProperty
                                        .resolveWith((states) {
                                      if (states.contains(
                                          MaterialState.pressed)) {
                                        return Colors.white;
                                      }
                                      return Colors.white;
                                    }),
                                    textStyle: MaterialStateProperty
                                        .resolveWith((states) {
                                      if (states.contains(
                                          MaterialState.pressed)) {
                                        return const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.5);
                                      }
                                      return const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.5);
                                    }),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith((states) {
                                      if (states.contains(
                                          MaterialState.pressed)) {
                                        return Colors.transparent;
                                      }
                                      return Colors.transparent;
                                    })),
                                child: const Text("노래 듣기",)
                            ),
                          ))
                    ],
                  );
                },
              ),
            ),
          );
        }
    );
  }
}
