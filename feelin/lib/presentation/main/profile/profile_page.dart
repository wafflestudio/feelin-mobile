import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/follow/follow_bloc.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';
import 'package:music_sns/presentation/follow/follow_page.dart';
import 'package:music_sns/presentation/main/profile/dynamic_sliver_app_bar.dart';
import 'package:music_sns/presentation/main/profile/follow_button.dart';
import 'package:music_sns/presentation/main/profile/post_preview.dart';

import '../../../injection.dart';


class ProfilePage extends StatefulWidget{
  final String? userId;
  final ScrollController scrollController;
  const ProfilePage({Key? key, this.userId, required this.scrollController}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin<ProfilePage>{
  final storage = const FlutterSecureStorage();
  String? token;
  String? id;

  GlobalKey globalKey = GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    print('ffffff'+widget.userId.toString());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });

  }

  _async() async{
    token = await storage.read(key: "token");
    id = await storage.read(key: 'id');
    print('ffffff'+id.toString());
  }

  @override
  Widget build(BuildContext context){
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return (state.isLoading) ? const Center(child: CupertinoActivityIndicator(radius: 20,)) : gridView();
      }
    );
  }


  Widget gridView(){
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: CustomScrollView(
                  controller: widget.scrollController,
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    DynamicSliverAppBar(key: globalKey, maxHeight: 600,child: _profileView(context),),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: PostPreview(index: index, post: state.posts[index]),
                                  );
                            }, childCount: state.posts.length,
                        ),
                    )
                  ],
                ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: state.profile.profileImage == null ? AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(state.profile.profileImage!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<FollowBloc>(),
                                    child: FollowPage(id: state.profile.id, isFollowerPage: true));
                              },
                            ),
                            );
                          },
                          child: AbsorbPointer(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${state.profile.followerCount}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.41,
                                  ),),
                                const SizedBox(width: 2,),
                                const Text('Followers',
                                  style: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: -0.41,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<FollowBloc>(),
                                    child: FollowPage(id: state.profile.id, isFollowerPage: false));
                              },
                            ),
                            );
                          },
                          child: AbsorbPointer(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${state.profile.followingCount}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.41,
                                  ),),
                                const SizedBox(width: 2,),
                                const Text('Following',
                                  style:  TextStyle(
                                      fontSize: 13,
                                      letterSpacing: -0.41,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if(state.profile.introduction != null && state.profile.introduction!.isNotEmpty)Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 0),
                  child: Text(state.profile.introduction ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                    ),
                  ),
              ),
              if(widget.userId != null && widget.userId != id!)
                Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FollowButton(isFollowed: state.isFollowed, function: (){
                  if(!state.isFollowed){
                    context.read<ProfileBloc>().add(const ProfileEvent.followRequest());
                  }else{
                    context.read<ProfileBloc>().add(const ProfileEvent.unFollowRequest());
                  }
                }),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        );
      }
    );
  }
}