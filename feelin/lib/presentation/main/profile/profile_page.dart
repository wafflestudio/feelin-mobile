
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
import 'package:music_sns/presentation/main/profile/follow_button.dart';
import 'package:music_sns/presentation/main/profile/post_preview.dart';

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

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
    context.read<ProfileBloc>().add(const ProfileEvent.pageRequest(0));
  }

  _async() async{
    token = await storage.read(key: "token");
  }

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return (state.isLoading) ? const Center(child: CupertinoActivityIndicator(radius: 20,)):gridView();
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
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: GridView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.82,
                        ),
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index){
                          return PostPreview(index: index, post: state.posts[index]);
                        },
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
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG',
                        //image: CachedNetworkImageProvider(state.profile.image ?? 'https://blog.kakaocdn.net/dn/XsNHt/btrb3m0cuQb/62QmvGg1bUVrI5uZfcWEi1/img.png'),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${state.posts.length}',
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        ),),
                        Text('Posts',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('123',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),),
                        Text('Followers',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('123',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),),
                        Text('Following',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),),
                      ],
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
              FollowButton(alreadyFollowed: false, function: (){}),
            ],
          ),
        );
      }
    );
  }
}