
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/domain/custom/focused_preview.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';

import '../../../domain/play/track.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  final storage = const FlutterSecureStorage();
  String? token;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
  }

  _async() async{
    token = await storage.read(key: "token");
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: gridView(),
    );
  }

  var posts = [
    Post(id: 1,
        writer: "Waffle",
        profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
        content: 'Playlist Example',
        playlist: Playlist(id: 1, title: "Examples", tracks: [
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
        ]),
    ),
    Post(id: 1,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: 1, title: "Examples2", tracks: [
        Track(id: 2,
            title: "Don't Cry for Me",
            artists: ["Silk"],
            album: "https://image.bugsm.co.kr/album/images/1000/200/20013.jpg"),
        Track(id: 1,
            title: "Never Gonna Let You Go",
            artists: ["Black Street"],
            album: "https://image.bugsm.co.kr/album/images/1000/80004/8000469.jpg"),
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
      ]),
    ),
    Post(id: 1,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'This is a Playlist Example',
      playlist: Playlist(id: 3, title: "Ex32", tracks: [
        Track(id: 1,
            title: "Never Been In Love Before",
            artists: ["Marva Hicks"],
            album: "https://m.media-amazon.com/images/I/71Qgw7igbtL._SS500_.jpg"),
        Track(id: 2,
            title: "Are You Lonely For Me",
            artists: ["Rude Boys"],
            album: "https://image.bugsm.co.kr/album/images/1000/10441/1044198.jpg"),
        Track(id: 3,
            title: "How Can I Ease The Pain",
            artists: ["Lisa Fischer"],
            album: "https://image.bugsm.co.kr/album/images/original/80076/8007692.jpg?version=undefined"),
        Track(id: 4,
            title: "If I Lose My Woman",
            artists: ["Kenny Lattimore"],
            album: "https://image.bugsm.co.kr/album/images/1000/80122/8012234.jpg"),
        Track(id: 5,
            title: "Have I Never",
            artists: ["A Few Good Men"],
            album: "https://image.bugsm.co.kr/album/images/1000/90007/9000729.jpg"),
        Track(id: 6,
            title: "Like An Echo",
            artists: ["Dee Harvey"],
            album: "https://i.ytimg.com/vi/_3c_p24Znlc/hqdefault.jpg"),
        Track(id: 7,
            title: "Crazy 'Bout Your Lovin'",
            artists: ["Robert Brookins"],
            album: "https://i.ytimg.com/vi/aLWNJmV-n5o/sddefault.jpg"),
        Track(id: 8,
            title: "I Don't Ever Want To See You Again",
            artists: ["Uncle Sam"],
            album: "https://image.bugsm.co.kr/album/images/1000/80125/8012599.jpg"),
      ]),
    ),
    Post(id: 1,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: 4, title: "white Example", tracks: [
        Track(id: 1, title: "Ai No Corrida", artists: ["Chaz Jankel","Chaz Jankel2", "Chaz Jankel3", "Chaz Jankel4"], album: "https://images.genius.com/d081fd7681ab0b644dadecf611d896ae.300x300x1.jpg")
      ]),
    ),
    Post(id: 1,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: 5, title: "Example89", tracks: [
        Track(id: 1, title: "Age Ain't Nothing But A Number", artists: ["Aaliyah"], album: "https://image.bugsm.co.kr/album/images/1000/104879/10487962.jpg"),
        Track(id: 2, title: "Candy Rain(Swing Of Things Corona Mix)", artists: ["Soul For Real"], album: "https://image.bugsm.co.kr/album/images/1000/143049/14304942.jpg"),
        Track(id: 3, title: "What About Your Friends", artists: ["TLC"], album: "https://image.bugsm.co.kr/album/images/1000/6520/652028.jpg"),
        Track(id: 4, title: "Froggy Style", artists: ["Nuttin' Nyce"], album: "https://image.bugsm.co.kr/album/images/1000/142896/14289603.jpg"),
        Track(id: 5, title: "Tic Tok", artists: ["Lorenzo Smith"], album: "https://image.bugsm.co.kr/album/images/1000/118551/11855187.jpg"),
        Track(id: 6, title: "Parlay", artists: ["Night & Day"], album: "https://i.ytimg.com/vi/PhaqNiLcaG8/maxresdefault.jpg"),
        Track(id: 7, title: "Player", artists: ["112"], album: "https://image.bugsm.co.kr/album/images/1000/80216/8021697.jpg"),
        Track(id: 8, title: "Do Little Things(Feat. Ivan Matias)", artists: ["Changing Faces"], album: "https://image.bugsm.co.kr/album/images/1000/80067/8006732.jpg"),
      ]),
    ),
    Post(id: 1,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: '퇴근길 양화대교의 감성을 가득 담은 플레이리스트입니다.\n퇴근할 때 들으면 좋아요.\n아니면 코딩할 때 들어도 좋아요!',
      playlist: Playlist(id: 6, title: "퇴근길 양화대교", tracks: [
        Track(id: 1, title: "운이 좋았지", artists: ["권진아",], album: "https://image.bugsm.co.kr/album/images/1000/202775/20277573.jpg"),
        Track(id: 2, title: "Warm On A Cold Night", artists: ["HONNE",], album: "https://image.bugsm.co.kr/album/images/1000/5558/555871.jpg"),
        Track(id: 3, title: "사라지나요", artists: ["PATEKO", "Jayci yucca"], album: "https://image.bugsm.co.kr/album/images/1000/40581/4058181.jpg"),
        Track(id: 1, title: "운이 좋았지", artists: ["권진아",], album: "https://image.bugsm.co.kr/album/images/1000/202775/20277573.jpg"),
        Track(id: 2, title: "Warm On A Cold Night", artists: ["HONNE",], album: "https://image.bugsm.co.kr/album/images/1000/5558/555871.jpg"),
        Track(id: 3, title: "사라지나요", artists: ["PATEKO", "Jayci yucca"], album: "https://image.bugsm.co.kr/album/images/1000/40581/4058181.jpg"),
        Track(id: 1, title: "운이 좋았지", artists: ["권진아",], album: "https://image.bugsm.co.kr/album/images/1000/202775/20277573.jpg"),
        Track(id: 2, title: "Warm On A Cold Night", artists: ["HONNE",], album: "https://image.bugsm.co.kr/album/images/1000/5558/555871.jpg"),
        Track(id: 3, title: "사라지나요", artists: ["PATEKO", "Jayci yucca"], album: "https://image.bugsm.co.kr/album/images/1000/40581/4058181.jpg"),
        Track(id: 1, title: "운이 좋았지", artists: ["권진아",], album: "https://image.bugsm.co.kr/album/images/1000/202775/20277573.jpg"),
        Track(id: 2, title: "Warm On A Cold Night", artists: ["HONNE",], album: "https://image.bugsm.co.kr/album/images/1000/5558/555871.jpg"),
        Track(id: 3, title: "사라지나요", artists: ["PATEKO", "Jayci yucca"], album: "https://image.bugsm.co.kr/album/images/1000/40581/4058181.jpg"),
        Track(id: 1, title: "운이 좋았지", artists: ["권진아",], album: "https://image.bugsm.co.kr/album/images/1000/202775/20277573.jpg"),
        Track(id: 2, title: "Warm On A Cold Night", artists: ["HONNE",], album: "https://image.bugsm.co.kr/album/images/1000/5558/555871.jpg"),
        Track(id: 3, title: "사라지나요", artists: ["PATEKO", "Jayci yucca"], album: "https://image.bugsm.co.kr/album/images/1000/40581/4058181.jpg"),
      ]),
    ),
    Post(id: 7,
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Good',
      playlist: Playlist(id: 4, title: "Example71", tracks: [
        Track(id: 1, title: "Darling Take Me Back", artists: ["New York City",], album: "https://i.scdn.co/image/ab67616d0000b273d385ec5b39ca1009651bace5"),
        Track(id: 1, title: "You're So Right For Me", artists: ["The Choice Four",], album: "https://i.ytimg.com/vi/zhPgodMEp8k/sddefault.jpg"),
        Track(id: 1, title: "Let Me Prove My Love To You", artists: ["The Main Ingredient",], album: "https://i.scdn.co/image/ab67616d0000b273101135bbe3e1915204205122"),
        Track(id: 1, title: "Sunshine", artists: ["Enchantment",], album: "https://i.ytimg.com/vi/o8_i_ONHvsw/sddefault.jpg"),
        Track(id: 1, title: "Headed In The Right Direction", artists: ["Piranha",], album: "https://m.media-amazon.com/images/I/51m8WG-EcZL.jpg"),
        Track(id: 1, title: "I Just Want To Spend The Night With You", artists: ["Ace Spectrum",], album: "https://image.bugsm.co.kr/album/images/500/7085/708536.jpg"),
        Track(id: 1, title: "Lonely Lonely", artists: ["The Intruders",], album: "https://image.bugsm.co.kr/album/images/1000/104807/10480790.jpg"),
        Track(id: 1, title: "Sunrise", artists: ["The Originals",], album: "https://image.bugsm.co.kr/album/images/1000/6650/665052.jpg"),
      ]),
    ),
  ];


  var name = "김와플";
  var username = 'Waffle';
  var profileImage = 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG';
  var bio = '안녕하세요';
  var tags = ['R&B', 'Soul', 'POP'];

  final ScrollController scrollController = ScrollController();

  Widget gridView(){
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _profileView(context),
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
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: GridView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          // onTap: (){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistInfoPage(post: posts[index], heroNumber: index,)));
                          // },
                          // onLongPress: (){
                          //   showPreview(context, posts[index], index);
                          // },
                          child: FocusedPreView(
                            index: index,
                            isRight: (index.isEven) ? false : true,
                            post: posts[index],
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistInfoPage(post: posts[index], heroNumber: index,)));
                            },
                            secondChild: IgnorePointer(
                              child: Hero(
                                tag: "playlistTitle$index",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      posts[index].playlist.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Hero(
                                tag: "playlistCover$index",
                                child: Image(
                                  image: NetworkImage(
                                      posts[index].playlist.tracks[0].album),
                                  fit: BoxFit.cover,
                                  ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget _profileView(context) {
    final ScrollController scrollController = ScrollController();

    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: NetworkImage(profileImage),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(username,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            itemCount: tags.length,
                            itemBuilder: (context, index){
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 10,
                                  padding: const EdgeInsets.all(5),
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
                                  child: Text(tags[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 10,),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(5),
                        //       child: Container(
                        //         padding: EdgeInsets.all(5),
                        //         decoration: const BoxDecoration(
                        //             gradient: LinearGradient(
                        //                 begin: FractionalOffset(0.0, 0.0),
                        //                 end: FractionalOffset(1.0, 1.0),
                        //                 colors: <Color>[
                        //                   Color(0xff00C19C),
                        //                   Color(0xff7077D5),
                        //                 ],
                        //                 stops: <double>[0.0, 1.0],
                        //                 tileMode: TileMode.clamp
                        //             )
                        //         ),
                        //         child: const Text("R&B",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w700,
                        //             fontSize: 11,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(5),
                        //       child: Container(
                        //         padding: EdgeInsets.all(5),
                        //         decoration: const BoxDecoration(
                        //             gradient: LinearGradient(
                        //                 begin: FractionalOffset(0.0, 0.0),
                        //                 end: FractionalOffset(1.0, 1.0),
                        //                 colors: <Color>[
                        //                   Color(0xff00C19C),
                        //                   Color(0xff7077D5),
                        //                 ],
                        //                 stops: <double>[0.0, 1.0],
                        //                 tileMode: TileMode.clamp
                        //             )
                        //         ),
                        //         child: const Text("Soul",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w700,
                        //             fontSize: 11,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(5),
                        //       child: Container(
                        //         padding: EdgeInsets.all(5),
                        //         decoration: const BoxDecoration(
                        //             gradient: LinearGradient(
                        //                 begin: FractionalOffset(0.0, 0.0),
                        //                 end: FractionalOffset(1.0, 1.0),
                        //                 colors: <Color>[
                        //                   Color(0xff00C19C),
                        //                   Color(0xff7077D5),
                        //                 ],
                        //                 stops: <double>[0.0, 1.0],
                        //                 tileMode: TileMode.clamp
                        //             )
                        //         ),
                        //         child: const Text("POP",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w700,
                        //             fontSize: 11,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 50,
                      width: 70,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${posts.length}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),),
                          const Text("playlists",
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      ),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 4),
            child: Text(name,
              style: const TextStyle(
                  fontSize: 13,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 4, bottom: 0),
              child: Text(bio,
                style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                ),
              ),
          ),
        ],
      ),
    );
  }
}