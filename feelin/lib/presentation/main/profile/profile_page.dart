
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';
import 'package:music_sns/domain/custom/focused_preview.dart';
import 'package:music_sns/domain/play/album.dart';
import 'package:music_sns/domain/play/artist.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';

import '../../../domain/play/playlist_preview.dart';
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
    context.read<ProfileBloc>().add(const ProfileEvent.pageRequest(1));
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
    Post(id: '1',
        writer: "Waffle",
        profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
        content: 'Playlist Example',
        playlist: Playlist(id: '1', title: "Examples",
            playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
            tracks: [
          Track(id: '1',
              title: "Never Gonna Let You Go",
              artists: [Artist(id : "1", name: "Black Street")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80004/8000469.jpg")),
          Track(id: '2',
              title: "Don't Cry for Me",
              artists: [Artist(id : '1', name:"Silk")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/200/20013.jpg")),
          Track(id: '3',
              title: "Kick It Tonight",
              artists: [Artist(id : '1', name:"Profyle")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150989/15098992.jpg")),
          Track(id: '4',
              title: "Slip Away",
              artists: [Artist(id : '1', name:"Ol Skool")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150980/15098036.jpg")),
          Track(id: '5',
              title: "I've Got To Show You",
              artists: [Artist(id : '1', name:"Yours Truly")],
              album: Album(id: '1', title: '', thumbnail: "https://i.ytimg.com/vi/JjrcQfpCU9c/sddefault.jpg")),
          Track(id: '6',
              title: "I Don't Wanna Let (Your Love Go)",
              artists: [Artist(id : '1', name:"For Lovers Only")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150947/15094751.jpg")),
          Track(id: '7',
              title: "Do It Like That",
              artists: [Artist(id : '1', name:"U-Mynd")],
              album: Album(id: '1', title: '', thumbnail: "https://i.scdn.co/image/ab67616d0000b273875bb658f3dbe73c23423559")),
          Track(id: '8',
              title: "Home Again",
              artists: [Artist(id : '1', name:"New Edition")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/201/20178.jpg")),
          Track(id: '9',
              title: "Why Can't We Be Lovers",
              artists: [Artist(id : '1', name:"Lamont Dozier Jr")],
              album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/155132/15513203.jpg")),
          Track(id: '10',
              title: "Don't Let It Be Too Late",
              artists: [Artist(id : '1', name:"John White")],
              album: Album(id: '1', title: '', thumbnail: "https://i.scdn.co/image/ab67616d0000b27327cec286ca7210d7a133293d")),
          Track(id: '11',
              title: "My, My, My",
              artists: [Artist(id : '1', name:"Johnny Gill)")],
              album: Album(id:' 1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/131370/13137016.jpg")),
          Track(id: '12',
              title: "I Don't Wanna Fight",
              artists: [Artist(id : '1', name:"Tina Turner")],
              album: Album(id: '1,', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/10947/1094745.jpg")),
        ]),
    ),
    Post(id:' 1',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: '1', title: "Examples2",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
        Track(id: '2',
            title: "Don't Cry for Me",
            artists: [Artist(id : '1', name:"Silk")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/200/20013.jpg")),
        Track(id: '1',
            title: "Never Gonna Let You Go",
            artists: [Artist(id : '1', name:"Black Street")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80004/8000469.jpg")),
        Track(id: '3',
            title: "Kick It Tonight",
            artists: [Artist(id : '1', name:"Profyle")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150989/15098992.jpg")),
        Track(id: '4',
            title: "Slip Away",
            artists: [Artist(id : '1', name:"Ol Skool")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150980/15098036.jpg")),
        Track(id: '5',
            title: "I've Got To Show You",
            artists: [Artist(id : '1', name:"Yours Truly")],
            album: Album(id: '1', title: '', thumbnail: "https://i.ytimg.com/vi/JjrcQfpCU9c/sddefault.jpg")),
        Track(id: '6',
            title: "I Don't Wanna Let (Your Love Go)",
            artists: [Artist(id : '1', name:"For Lovers Only")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/150947/15094751.jpg")),
        Track(id: '7',
            title: "Do It Like That",
            artists: [Artist(id : '1', name:"U-Mynd")],
            album: Album(id: '1', title: '', thumbnail: "https://i.scdn.co/image/ab67616d0000b273875bb658f3dbe73c23423559")),
        Track(id: '8',
            title: "Home Again",
            artists: [Artist(id : '1', name:"New Edition")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/201/20178.jpg")),
        Track(id: '9',
            title: "Why Can't We Be Lovers",
            artists: [Artist(id : '1', name:"Lamont Dozier Jr")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/155132/15513203.jpg")),
        Track(id: '10',
            title: "Don't Let It Be Too Late",
            artists: [Artist(id : '1', name:"John White")],
            album: Album(id: '1', title: '', thumbnail: "https://i.scdn.co/image/ab67616d0000b27327cec286ca7210d7a133293d")),
        Track(id: '11',
            title: "My, My, My",
            artists: [Artist(id: '1', name: "Johnny Gill")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/131370/13137016.jpg")),
        Track(id: '12',
            title: "I Don't Wanna Fight",
            artists: [Artist(id: '1', name: "Tina Turner")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/10947/1094745.jpg")),
      ]),
    ),
    Post(id: '1',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'This is a Playlist Example',
      playlist: Playlist(id: '3', title: "Ex32",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
        Track(id: '1',
            title: "Never Been In Love Before",
            artists: [Artist(id: '1', name: "Marva Hicks")],
            album: Album(id: '1', title: '', thumbnail: "https://m.media-amazon.com/images/I/71Qgw7igbtL._SS500_.jpg")),
        Track(id: '2',
            title: "Are You Lonely For Me",
            artists: [Artist(id: '1', name: "Rude Boys")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/10441/1044198.jpg")),
        Track(id: '3',
            title: "How Can I Ease The Pain",
            artists: [Artist(id: '1', name: "Lisa Fischer")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80076/8007692.jpg")),
        Track(id: '4',
            title: "If I Lose My Woman",
            artists: [Artist(id: '1', name: "Kenny Lattimore")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80122/8012234.jpg")),
        Track(id: '5',
            title: "Have I Never",
            artists: [Artist(id: '1', name: "A Few Good Men")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/90007/9000729.jpg")),
        Track(id: '6',
            title: "Like An Echo",
            artists: [Artist(id: '1', name: "Dee Harvey")],
            album: Album(id: '1', title: '', thumbnail: "https://i.ytimg.com/vi/_3c_p24Znlc/hqdefault.jpg")),
        Track(id: '7',
            title: "Crazy 'Bout Your Lovin'",
            artists: [Artist(id: '1', name: "Robert Brookins")],
            album: Album(id: '1', title: '', thumbnail: "https://i.ytimg.com/vi/aLWNJmV-n5o/sddefault.jpg")),
        Track(id: '8',
            title: "I Don't Ever Want To See You Again",
            artists: [Artist(id: '1', name: "Uncle Sam")],
            album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80125/8012599.jpg")),
      ]),
    ),
    Post(id: '1',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: '4', title: "white Example",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
        Track(id: '1', title: "Ai No Corrida", artists: [Artist(id: '1', name: "Chaz Jankel"),], album: Album(id: '1', title: '', thumbnail: "https://images.genius.com/d081fd7681ab0b644dadecf611d896ae.300x300x1.jpg"))
      ]),
    ),
    Post(id: '1',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Playlist Example',
      playlist: Playlist(id: '5', title: "Example89",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
        Track(id: '1', title: "Age Ain't Nothing But A Number", artists: [Artist(id: '1', name: "Aaliyah")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/104879/10487962.jpg")),
        Track(id: '2', title: "Candy Rain(Swing Of Things Corona Mix)", artists: [Artist(id: '1', name: "Soul For Real")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/143049/14304942.jpg")),
        Track(id: '3', title: "What About Your Friends", artists: [Artist(id: '1', name: "TLC")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/6520/652028.jpg")),
        Track(id: '4', title: "Froggy Style", artists: [Artist(id: '1', name: "Nuttin' Nyce")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/142896/14289603.jpg")),
        Track(id: '5', title: "Tic Tok", artists: [Artist(id: '1', name: "Lorenzo Smith")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/118551/11855187.jpg")),
        Track(id: '6', title: "Parlay", artists: [Artist(id: '1', name: "Night & Day")], album: Album(id: '1', title: '', thumbnail: "https://i.ytimg.com/vi/PhaqNiLcaG8/maxresdefault.jpg")),
        Track(id: '7', title: "Player", artists: [Artist(id: '1', name: "112")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80216/8021697.jpg")),
        Track(id: '8', title: "Do Little Things(Feat. Ivan Matias)", artists: [Artist(id: '1', name: "Changing Faces")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/80067/8006732.jpg")),
      ]),
    ),
    Post(id: '1',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: '퇴근길 양화대교의 감성을 가득 담은 플레이리스트입니다.\n퇴근할 때 들으면 좋아요.\n아니면 코딩할 때 들어도 좋아요!',
      playlist: Playlist(id: '6', title: "퇴근길 양화대교",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
            Track(id: '1', title: "운이 좋았지", artists: [Artist(id: '1', name: "권진아"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/202775/20277573.jpg")),
            Track(id: '2', title: "Warm On A Cold Night", artists: [Artist(id: '1', name: "HONNE"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/5558/555871.jpg")),
            Track(id: '3', title: "사라지나요", artists: [Artist(id: '1', name:"PATEKO"), Artist(id: '1', name: "Jayci yucca")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/40581/4058181.jpg")),
            Track(id: '1', title: "운이 좋았지", artists: [Artist(id: '1', name: "권진아"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/202775/20277573.jpg")),
            Track(id: '2', title: "Warm On A Cold Night", artists: [Artist(id: '1', name: "HONNE"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/5558/555871.jpg")),
            Track(id: '3', title: "사라지나요", artists: [Artist(id: '1', name:"PATEKO"), Artist(id: '1', name: "Jayci yucca")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/40581/4058181.jpg")),
            Track(id: '1', title: "운이 좋았지", artists: [Artist(id: '1', name: "권진아"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/202775/20277573.jpg")),
            Track(id: '2', title: "Warm On A Cold Night", artists: [Artist(id: '1', name: "HONNE"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/5558/555871.jpg")),
            Track(id: '3', title: "사라지나요", artists: [Artist(id: '1', name:"PATEKO"), Artist(id: '1', name: "Jayci yucca")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/40581/4058181.jpg")),
            Track(id: '1', title: "운이 좋았지", artists: [Artist(id: '1', name: "권진아"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/202775/20277573.jpg")),
            Track(id: '2', title: "Warm On A Cold Night", artists: [Artist(id: '1', name: "HONNE"),], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/5558/555871.jpg")),
            Track(id: '3', title: "사라지나요", artists: [Artist(id: '1', name:"PATEKO"), Artist(id: '1', name: "Jayci yucca")], album: Album(id: '1', title: '', thumbnail: "https://image.bugsm.co.kr/album/images/500/40581/4058181.jpg")),
      ]),
    ),
    Post(id: '7',
      writer: "Waffle",
      profile: 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
      content: 'Good',
      playlist: Playlist(id: '4', title: "Example71",
          playlistPreview: PlaylistPreview(id: '1', thumbnail: ''),
          tracks: [
        Track(id: '1', title: "Darling Take Me Back", artists: [Artist(id: '1', name:"New York City"),], album: Album(id: '1', title: '', thumbnail:"https://i.scdn.co/image/ab67616d0000b273d385ec5b39ca1009651bace5")),
        Track(id: '1', title: "You're So Right For Me", artists: [Artist(id: '1', name:"The Choice Four"),], album: Album(id: '1', title: '', thumbnail:"https://i.ytimg.com/vi/zhPgodMEp8k/sddefault.jpg")),
        Track(id: '1', title: "Let Me Prove My Love To You", artists: [Artist(id: '1', name:"The Main Ingredient"),], album: Album(id: '1', title: '', thumbnail:"https://i.scdn.co/image/ab67616d0000b273101135bbe3e1915204205122")),
        Track(id: '1', title: "Sunshine", artists: [Artist(id: '1', name:"Enchantment"),], album: Album(id: '1', title: '', thumbnail:"https://i.ytimg.com/vi/o8_i_ONHvsw/sddefault.jpg")),
        Track(id: '1', title: "Headed In The Right Direction", artists: [Artist(id: '1', name:"Piranha"),], album: Album(id: '1', title: '', thumbnail:"https://m.media-amazon.com/images/I/51m8WG-EcZL.jpg")),
        Track(id: '1', title: "I Just Want To Spend The Night With You", artists: [Artist(id: '1', name:"Ace Spectrum"),], album: Album(id: '1', title: '', thumbnail:"https://image.bugsm.co.kr/album/images/500/7085/708536.jpg")),
        Track(id: '1', title: "Lonely Lonely", artists: [Artist(id: '1', name:"The Intruders"),], album: Album(id: '1', title: '', thumbnail:"https://image.bugsm.co.kr/album/images/500/104807/10480790.jpg")),
        Track(id: '1', title: "Sunrise", artists: [Artist(id: '1', name:"The Originals"),], album: Album(id: '1', title: '', thumbnail:"https://image.bugsm.co.kr/album/images/500/6650/665052.jpg")),
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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
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
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index){
                          return SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Hero(
                              tag: "playlistCover$index",
                              child: Image(
                                image: NetworkImage(
                                    state.posts[index].thumbnail),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                          // itemBuilder: (BuildContext context, int index){
                          //   return FocusedPreView(
                          //     index: index,
                          //     isRight: (index.isEven) ? false : true,
                          //     post: posts[index],
                          //     onPressed: (){
                          //       Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistInfoPage(post: posts[index], heroNumber: index,)));
                          //     },
                          //     secondChild: IgnorePointer(
                          //       child: Hero(
                          //         tag: "playlistTitle$index",
                          //         child: Material(
                          //           type: MaterialType.transparency,
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //               color: Colors.black12,
                          //               borderRadius: BorderRadius.circular(5),
                          //             ),
                          //             padding: const EdgeInsets.all(5),
                          //             child: Text(
                          //               posts[index].playlist.title,
                          //               textAlign: TextAlign.center,
                          //               style: const TextStyle(
                          //                   color: Colors.white70,
                          //                   fontWeight: FontWeight.w700,
                          //                   fontSize: 17
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     child: SizedBox(
                          //       width: double.infinity,
                          //       height: double.infinity,
                          //       child: Hero(
                          //         tag: "playlistCover$index",
                          //         child: Image(
                          //           image: NetworkImage(
                          //               posts[index].playlist.tracks[0].album.thumbnail),
                          //           fit: BoxFit.cover,
                          //           ),
                          //       ),
                          //     ),
                          //   );
                          //}
                      ),
                    ),
                  )
                ],
              );
            });
      }
    );
  }

  Widget _profileView(context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
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
                              Text("${state.posts.length}",
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
    );
  }
}