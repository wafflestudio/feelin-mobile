import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/edit/edit_post_form/edit_post_form_bloc.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/application/share/share.dart';
import 'package:music_sns/domain/custom/marquee.dart';
import 'package:music_sns/domain/play/track.dart';
import 'package:music_sns/injection.dart';

import '../../../application/navigation/nav_bar_item.dart';
import '../../../application/navigation/navigation_cubit.dart';
import '../../../domain/play/post.dart';
import '../../edit/post/edit_post_page.dart';
import '../root_page.dart';

class PlaylistInfoPage extends StatefulWidget{
  const PlaylistInfoPage({Key? key, required this.post, required this.postId, required this.heroNumber}) : super(key: key);

  final Post post;
  final int postId;
  final int heroNumber;

  @override
  State<PlaylistInfoPage> createState() => _PlaylistInfoPageState();
}

class _PlaylistInfoPageState extends State<PlaylistInfoPage> {

  @override
  void initState(){
    super.initState();
    context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.loadRequest(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistInfoBloc, PlaylistInfoState>(
      listener: (context, state){
        state.maybeWhen((loadFailureOrSuccessOption, deleteFailureOrSuccessOption, post, isLoading) =>
            deleteFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (unit) => {
                  print('test'),
                  Navigator.pop(context),
            },
          ),
        ), orElse: () {});
      },
      child: BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
          return state.when(
                  (loadFailureOrSuccessOption, deleteFailureOrSuccessOption, post, isLoading) {
                    if(isLoading) {
                      return Scaffold(
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        title: const Text(''),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                        body: Column(
                          children: [
                            SizedBox(
                              child: _playlistCover(context),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.5,
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
                            ),
                            Container(
                                height: 300,
                                child: CupertinoActivityIndicator(radius: 20,)),
                          ],
                        ),
                    );
                    }
                    return Scaffold(
                      key: widget.key,
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        title: const Text(''),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                        actions: [IconButton(onPressed: (){
                          showModalBottomSheet<void>(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 60,
                                      child: TextButton(onPressed: (){


                                      }, child: const Text('공유하기', textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 16),)),
                                    ),
                                    SizedBox(
                                        width: double.infinity,
                                        height: 60,
                                        child: TextButton(onPressed: (){
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                                  builder: (context) => BlocProvider(create: (context) => getIt<EditPostFormBloc>(),
                                                  child: EditPostPage(post: post.clone(),),
                                              ))
                                          );
                                        }, child: const Text('수정하기', style: TextStyle(color: Colors.black, fontSize: 16),))),
                                    SizedBox(
                                        width: double.infinity,
                                        height: 60,
                                        child: TextButton(onPressed: (){
                                          getIt<PlaylistInfoBloc>().add(PlaylistInfoEvent.deleteRequest(post.id));
                                          Navigator.pop(context);
                                        }, child: const Text('삭제하기', style: TextStyle(color: Colors.red, fontSize: 16),))),
                                  ],
                                ),
                              );
                            },
                          ).then((value) { setState(() { }); });
                        }, icon: const Icon(Icons.more_vert))],
                      ),
                      body: Column(
                        children: [
                          SizedBox(
                            child: _playlistCover(context),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.5,
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
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: listView(),
                          ),
                        ],
                      ),
                    );
                  },
              loading: () => const CircularProgressIndicator(),
              loaded: () => const CircularProgressIndicator(),
          );
        }
      ),
    );
  }


  var playTime = '??';

  Widget listView() {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
      builder: (context, state) {
        return state.maybeWhen((loadFailureOrSuccessOption, deleteFailureOrSuccessOption,post, isLoading) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Scrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        itemCount: post.playlist.tracks!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              showPopup(context, post.playlist.tracks!, index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Image(
                                    image: CachedNetworkImageProvider(
                                        post.playlist.tracks![index].album.thumbnail),
                                    fit: BoxFit.cover,
                                    width: 45,
                                    height: 45,),
                                  _itemText(context, index),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                );
              }
          );
        }, orElse: () => const SizedBox.shrink() );
      }
    );
  }

  Widget _itemText(context, int index) {
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
      builder: (context, state) {
        return state.maybeWhen((loadFailureOrSuccessOption, deleteFailureOrSuccessOption,post, isLoading) {
          return Container(
            alignment: Alignment.centerLeft,
            height: 35,
            width: MediaQuery.of(context).size.width - 95,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(post.playlist.tracks![index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
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
                      itemCount: post.playlist.tracks![index].artists.length,
                      itemBuilder: (context, index2){
                        return Text(
                          post.playlist.tracks![index].artists[index2].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xff7077D5),
                              fontSize: 12
                          ),
                        );
                      },
                      separatorBuilder: (context, index2) => const Text(
                        ", ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff7077D5),
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
            orElse: () => const SizedBox.shrink());
      }
    );
  }

  Widget _playlistCover(context) {
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
        builder: (context, state) {
          return state.maybeWhen(
                (loadFailureOrSuccessOption, deleteFailureOrSuccessOption,post, isLoading) {
              return Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Hero(
                              tag: "playlistCover${widget.heroNumber}",
                              child: Image(
                                image: CachedNetworkImageProvider(widget.post.playlist.thumbnail!),
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if(!isLoading)Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        image: CachedNetworkImageProvider(post.writer!.image ?? 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG'),
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(post.writer!.username,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ) else SizedBox(height: 30,),
                                SizedBox(
                                  width: 174,
                                  child: Marquee(
                                    direction: Axis.horizontal,
                                    child: Text(
                                      widget.post.title,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.music_note,
                                      color: Color(0xff00C19C),),
                                    Text('${post.playlist.tracks!.length}곡',
                                      style: const TextStyle(
                                          color: Color(0xff00C19C),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14
                                      ),),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(Icons.access_time,
                                      color: Color(0xff00C19C),),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('$playTime분',
                                      style: const TextStyle(
                                          color: Color(0xff00C19C),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14
                                      ),)
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share(context: context).share(widget.post.id, widget.post.title, widget.post.playlist.thumbnail!);
                                  },
                                  child: Row(
                                      children: const [
                                        Icon(Icons.ios_share,
                                          color: Colors.grey,),
                                        Text('공유하기',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14
                                          ),
                                        ),
                                      ]),
                                ),
                                /*
                          Container(
                            height: 20,

                            child: ElevatedButton.icon(
                                onPressed: (){},
                                label: const Text('공유하기'),
                                icon: const Icon(Icons.ios_share,
                                size: 18,),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  foregroundColor: MaterialStateProperty.all(Colors.grey),
                                  elevation: MaterialStateProperty.all(0.0)
                                ),),
                          ),
                           */
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(post.content,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.5,
                          ),)),
                    _storeButton(context),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        }
    );
  }

  Widget _storeButton(context) {
    return Container(
        width: double.infinity,
        height: 30,
        margin: const EdgeInsets.all(2),
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
          //margin: const EdgeInsets.all(0),
          child: OutlinedButton(
              onPressed: () {
                //choosePlatform(context);
              } //TODO: implement to store a playlist.
              ,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      const ContinuousRectangleBorder()),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.white;
                  }),
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const TextStyle(
                          color: Colors.white,
                          fontSize: 13.5);
                    }
                    return const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.transparent;
                    }
                    return Colors.transparent;
                  })),
              child: const Text("내 계정에 플레이리스트 저장",)
          ),
        ));
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