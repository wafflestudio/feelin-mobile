
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_page.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';

import '../../../domain/profile/profile.dart';
import '../../../injection.dart';
import '../../edit/profile/edit_profile_page.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  final storage = const FlutterSecureStorage();
  String? token;

  final tags = ['R&B', 'Folk'];

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
    context.read<ProfileBloc>().add(const ProfileEvent.pageRequest(0));
    context.read<ProfileBloc>().add(const ProfileEvent.profileRequest());
  }

  _async() async{
    token = await storage.read(key: "token");
  }

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: const Text('Feelin\'',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [IconButton(onPressed: () async{
              final newProfile = await showModalBottomSheet<Profile>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: () async {
                            Profile newProfile = await Navigator.push(context, CupertinoPageRoute(
                                builder: (context){
                                  return BlocProvider(
                                      create: (context) => getIt<EditProfileFormBloc>(),
                                      child: EditProfilePage(profile: state.profile));
                                }
                            ),
                            );
                            if (!mounted) return;
                            Navigator.pop(context, newProfile);
                          }, child: const Text('프로필 수정하기', style: TextStyle(color: Colors.black, fontSize: 16),)),
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: TextButton(onPressed: (){}, child: const Text('설정', style: TextStyle(color: Colors.black, fontSize: 16),))),
                        SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: TextButton(onPressed: (){
                              storage.deleteAll();
                              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context){
                                return const SignInPage();
                              }),(route) => false);
                            }, child: const Text('로그아웃', style: TextStyle(color: Colors.black, fontSize: 16),))),
                      ],
                    ),
                  );
                },
              );
              if (!mounted) return;
              if(newProfile != null)context.read<ProfileBloc>().add(ProfileEvent.profileChanged(newProfile));
            }, icon: const Icon(Icons.table_rows))],
          ),
          body: (state.isLoading) ? const Center(child: CupertinoActivityIndicator(radius: 20,)):gridView() ,
        );
      }
    );
  }

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
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (context){
                                      return BlocProvider(
                                          create: (context) => getIt<PlaylistInfoBloc>(),
                                          child: PlaylistInfoPage(postId: state.posts[index].id, heroNumber: index,));
                                    },
                                ),
                                );
                              },
                              child: Hero(
                                tag: "playlistCover$index",
                                child: Image(
                                  image: CachedNetworkImageProvider(
                                      state.posts[index].playlist.thumbnail!),
                                  fit: BoxFit.cover,
                                ),
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
                          //       Navigator.push(context, CupertinoPageRoute(builder: (context) => PlaylistInfoPage(post: posts[index], heroNumber: index,)));
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
                        image: CachedNetworkImageProvider(state.profile.image!.isNotEmpty ? state.profile.image! : 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG'),
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
                            Text(state.profile.username,
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
                              Text("${state.profile.countPosts}",
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
                child: Text(state.profile.username,
                  style: const TextStyle(
                      fontSize: 13,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 0),
                  child: Text(state.profile.introduction ?? '',
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