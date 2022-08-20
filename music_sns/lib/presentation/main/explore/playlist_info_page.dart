
import 'package:flutter/material.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/track.dart';

class PlaylistInfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        leading: IconButton(
          onPressed: () {}, //TODO: implement to go back
          color: Colors.grey,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        child: listView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_outlined),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
          ),
        ],
      ),
    );
  }

  var playlist = Playlist(id: 1, title: "Examples", tracks: [
    Track(id: 1,
        title: "Never Gonna Let You Go",
        artists: ["Black Street"],
        album: "https://image.bugsm.co.kr/album/images/1000/80004/8000469.jpg"),
    Track(id: 2,
        title: "Don't Cry for Me",
        artists: ["Silk"],
        album: "https://image.bugsm.co.kr/album/images/1000/200/20013.jpg"),
    Track(id: 3,
        title: "Kick It Tonight",
        artists: ["Profyle"],
        album: "https://image.bugsm.co.kr/album/images/1000/150989/15098992.jpg"),
    Track(id: 4,
        title: "Slip Away",
        artists: ["Ol Skool"],
        album: "https://image.bugsm.co.kr/album/images/1000/150980/15098036.jpg"),
    Track(id: 5,
        title: "I've Got To Show You",
        artists: ["Yours Truly"],
        album: "https://i.ytimg.com/vi/JjrcQfpCU9c/sddefault.jpg"),
    Track(id: 6,
        title: "I Don't Wanna Let (Your Love Go)",
        artists: ["For Lovers Only"],
        album: "https://image.bugsm.co.kr/album/images/1000/150947/15094751.jpg"),
    Track(id: 7,
        title: "Do It Like That",
        artists: ["U-Mynd"],
        album: "https://i.scdn.co/image/ab67616d0000b273875bb658f3dbe73c23423559"),
    Track(id: 8,
        title: "Home Again",
        artists: ["New Edition"],
        album: "https://image.bugsm.co.kr/album/images/1000/201/20178.jpg"),
    Track(id: 9,
        title: "Why Can't We Be Lovers",
        artists: ["Lamont Dozier Jr"],
        album: "https://image.bugsm.co.kr/album/images/1000/155132/15513203.jpg"),
    Track(id: 10,
        title: "Don't Let It Be Too Late",
        artists: ["John White"],
        album: "https://i.scdn.co/image/ab67616d0000b27327cec286ca7210d7a133293d"),
    Track(id: 11,
        title: "My, My, My",
        artists: ["Johnny Gill"],
        album: "https://image.bugsm.co.kr/album/images/1000/131370/13137016.jpg"),
    Track(id: 12,
        title: "I Don't Wanna Fight",
        artists: ["Tina Turner"],
        album: "https://image.bugsm.co.kr/album/images/1000/10947/1094745.jpg"),
  ]);


  var username = '김와플';
  var playTime = '57';
  var coverImage = 'https://image.bugsm.co.kr/album/images/1000/200/20013.jpg';
  var profileImage = 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG';
  var content = 'Example';

  Widget listView() {
    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisSize: MainAxisSize.max,
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
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Scrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: playlist.tracks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              showPopup(context, playlist.tracks, index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        playlist.tracks[index].album),
                                    width: 45,
                                    height: 45,),
                                  _itemText(index),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),

            ],
          );
        }
    );
  }

  Widget _itemText(int index) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(playlist.tracks[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(playlist.tracks[index].artists.first,
            style: const TextStyle(fontSize: 12, color: Color(0xff7077D5)),),
        ],
      ),
    );
  }

  Widget _playlistCover(context) {
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
                Image(
                  image: NetworkImage(coverImage),
                  width: 130,
                  height: 130,),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: NetworkImage(profileImage),
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(username),
                        ],
                      ),
                      Text(
                        playlist.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.music_note,
                            color: Color(0xff00C19C),),
                          Text('${playlist.tracks.length}곡',
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
              child: Text(content,
                style: const TextStyle(
                    fontSize: 13
                ),)),
          _storeButton(context),
        ],
      ),
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
                choosePlatform(context);
              } //TODO: implement to store a playlist.
              ,
              child: const Text("내 계정에 플레이리스트 저장",),
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
                  }))
          ),
        ));
  }

  void showPopup(context, tracks, index) {
    showDialog(context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.black12,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7 + 50,
              child: PageView.builder(
                controller: PageController(initialPage: index),
                itemCount: tracks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Image(
                          image: NetworkImage(tracks[index].album),
                          fit: BoxFit.cover,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.6,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.6),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(tracks[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                                color: Color(0xff00C19C),
                              ),
                            ),
                            Text(tracks[index].artists.first,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xff7077D5)),),
                          ],
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
                                  choosePlatform(context);
                                }
                                //TODO: implement to store a track.
                                ,
                                child: const Text("노래 듣기",),
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
                                    }))
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
  void choosePlatform(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            children: [
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      image: NetworkImage('https://play-lh.googleusercontent.com/GweSpOJ7p8RZ0lzMDr7sU0x5EtvbsAubkVjLY-chdyV6exnSUfl99Am0g8X0w_a2Qo4'),
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Melon',
                  style: TextStyle(
                    color: Color(0xff04e632),
                    fontWeight: FontWeight.w700
                  ),),
                ],
              ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/gSjYDowrYi_BIdXKIsxhc4Y3Zj5zGA3os_SCm8cqWWCrXQYejcmser-UOEM-PnCGRgk'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Genie',
                      style: TextStyle(
                          color: Color(0xff448aff),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/GnYnNfKBr2nysHBYgYRCQtcv_RRNN0Sosn47F5ArKJu89DMR3_jHRAazoIVsPUoaMg'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('YouTube Music',
                      style: TextStyle(
                          color: Color(0xffff0000),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/31RGCuepZn9kCR-ASp6aM-fWNm34YvHX2EkkSsypIUHZ_nbDkKI_1Z8fsuSnfpvBEHk=w240-h480-rw'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Flo',
                      style: TextStyle(
                          color: Color(0xff2828ff),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/yHyThRQ7idHmfkEaz0abkkCYZAMbNulSU-hZL0TP-KgXTP9Y1ph1w8-n-l0kaBnrfI8=w240-h480-rw'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Vive',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/waHxALPR_cDykucu_QZ8YI7zEsuzzI-4_76bmD19WBx2JwBvNokISMcT5H6K8qxXvQ'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Kakao Music',
                      style: TextStyle(
                          color: Color(0xfffbe300),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/1EYBuARUQsNbhEQ1Ax4q9G-E_KuMuzxklmBdMXlIksKtYlebieUxvVLrrtQv6oBWR4k'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Bugs',
                      style: TextStyle(
                          color: Color(0xffff3c28),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/UrY7BAZ-XfXGpfkeWg0zCCeo-7ras4DCoRalC_WXXWTK9q5b0Iw7B0YQMsVxZaNB7DM'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Spotify',
                      style: TextStyle(
                          color: Color(0xff1ed760),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){},
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        image: NetworkImage('https://play-lh.googleusercontent.com/mOkjjo5Rzcpk7BsHrsLWnqVadUK1FlLd2-UlQvYkLL4E9A0LpyODNIQinXPfUMjUrbE'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Apple Music',
                      style: TextStyle(
                          color: Color(0xfffa2239),
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
              ),
            ],
            /*
            child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: const Image(
                            image: NetworkImage('https://play-lh.googleusercontent.com/GweSpOJ7p8RZ0lzMDr7sU0x5EtvbsAubkVjLY-chdyV6exnSUfl99Am0g8X0w_a2Qo4'),
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Melon'),
                      ],
                    )
                  ],
                )
            ),
            */
          );
        }
    );
  }
}