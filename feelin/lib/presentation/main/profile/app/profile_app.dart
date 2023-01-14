import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/presentation/main/profile/app/profile_app_bar.dart';

import '../../../../application/profile/profile_bloc.dart';
import '../../../../injection.dart';
import '../profile_page.dart';

class ProfileApp extends StatelessWidget {
  final int? userId;
  final GlobalKey<ProfileAppScaffoldState>? profileKey;

  const ProfileApp({Key? key, this.userId, this.profileKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ProfileBloc>(),
      child: ProfileAppScaffold(userId, key: profileKey,),
    );
  }
}

class ProfileAppScaffold extends StatefulWidget {
  final int? userId;

  const ProfileAppScaffold(this.userId, {Key? key}) : super(key: key);

  @override
  State<ProfileAppScaffold> createState() => ProfileAppScaffoldState();
}

class ProfileAppScaffoldState extends State<ProfileAppScaffold> {
  final storage = const FlutterSecureStorage();
  String? token;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
    if(widget.userId == null){
      context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest());
    }else{
      context.read<ProfileBloc>().add(ProfileEvent.profileRequest(widget.userId!));
    }
  }

  _async() async{
    token = await storage.read(key: "token");
  }

  void onRefresh() {
    if(widget.userId == null){
      context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest());
      context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest(0));
    }else{
      context.read<ProfileBloc>().add(ProfileEvent.profileRequest(widget.userId!));
      context.read<ProfileBloc>().add(ProfileEvent.pageRequest(0, widget.userId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: ProfileAppBar(isRoot: (widget.userId == null),),
      body: RefreshIndicator(
        onRefresh: () async => onRefresh(),
          child: const ProfilePage()),
    );
  }
}
