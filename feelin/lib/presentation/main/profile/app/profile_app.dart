import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/presentation/common/custom_visibility_detector.dart';
import 'package:music_sns/presentation/main/profile/app/profile_app_bar.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../../application/profile/profile_bloc.dart';
import '../../../../domain/profile/profile.dart';
import '../../../../injection.dart';
import '../../../common/restricted_page.dart';
import '../profile_page.dart';

class ProfileApp extends StatelessWidget {
  final String? userId;
  final Profile? sink;
  final GlobalKey<ProfileAppScaffoldState>? profileKey;

  const ProfileApp({Key? key, this.userId, this.profileKey, this.sink}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ProfileBloc>(),
      child: ProfileAppScaffold(userId, key: profileKey, sink: sink),
    );
  }
}

class ProfileAppScaffold extends StatefulWidget{
  final String? userId;
  final Profile? sink;
  const ProfileAppScaffold(this.userId, {Key? key, this.sink}) : super(key: key);

  @override
  State<ProfileAppScaffold> createState() => ProfileAppScaffoldState();
}

class ProfileAppScaffoldState extends State<ProfileAppScaffold> with AutomaticKeepAliveClientMixin<ProfileAppScaffold>{
  final storage = const FlutterSecureStorage();
  final ScrollController scrollController = ScrollController();
  String? token;

  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  void _firstLoad(){
    setState((){
      _isFirstLoadRunning = true;
    });
    context.read<ProfileBloc>().add(const ProfileEvent.resetRequest());
    if(widget.userId == null){
      context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest());
    }else{
      context.read<ProfileBloc>().add(ProfileEvent.profileRequest(widget.userId!));
    }
    if(widget.userId == null){
      context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest());
    }else{
      context.read<ProfileBloc>().add(ProfileEvent.pageRequest(widget.userId!));
    }
    setState(() => _isFirstLoadRunning = false);
  }

  void _loadMore() async {
    if (_isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      setState(() => _isLoadMoreRunning = true);
      if(widget.userId == null){
        context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest());
      }else{
        context.read<ProfileBloc>().add(ProfileEvent.pageRequest(widget.userId!));
      }
      setState(() => _isLoadMoreRunning = false);
    }
  }

  void onRefresh() {
    context.read<ProfileBloc>().add(const ProfileEvent.resetRequest());
    if(widget.userId == null){
      context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest());
      context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest());
    }else{
      context.read<ProfileBloc>().add(ProfileEvent.profileRequest(widget.userId!));
      context.read<ProfileBloc>().add(ProfileEvent.pageRequest(widget.userId!));
    }
  }

  void goToTop(){
    scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void removeItemByPostId(String id){
    context.read<ProfileBloc>().add(ProfileEvent.removeItemByPostId(id));
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    _firstLoad();
    scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    scrollController.removeListener(_loadMore);
    super.dispose();
  }

  bool firstLoaded = false;

  bool temp = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomVisibilityDetector(
      onVisibleGained: (){
        if(firstLoaded){
          if(widget.userId == null){
            context.read<ProfileBloc>().add(const ProfileEvent.reMyProfileRequest());
          }else{
            context.read<ProfileBloc>().add(ProfileEvent.reProfileRequest(widget.userId!));
          }
        }else{
          firstLoaded = true;
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.isRestricted ? const RestrictedPage() : Scaffold(
            appBar: ProfileAppBar(isRoot: (widget.userId == null), function: goToTop, onRefresh: onRefresh,
              onBack: (){
                Navigator.pop(context, state.isFollowed);
              },
            ),
            body: RefreshIndicator(
              color: FeelinColorFamily.redPrimary,
              onRefresh: () {
                onRefresh();
                return Future.delayed(const Duration(milliseconds: 400), ()=>Future<void>.value());
                },
                child: ProfilePage(userId: widget.userId, scrollController: scrollController, sink: widget.sink,)),
          );
        }
      ),
    );
  }
}
