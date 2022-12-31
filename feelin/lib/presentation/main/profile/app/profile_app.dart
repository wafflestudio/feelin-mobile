import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/presentation/main/profile/app/profile_app_bar.dart';

import '../../../../application/profile/profile_bloc.dart';
import '../../../../injection.dart';
import '../profile_page.dart';

class ProfileApp extends StatelessWidget {
  final int? userId;

  const ProfileApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ProfileBloc>(),
      child: ProfileAppScaffold(userId),
    );
  }
}

class ProfileAppScaffold extends StatefulWidget {
  final int? userId;

  const ProfileAppScaffold(this.userId, {Key? key}) : super(key: key);

  @override
  State<ProfileAppScaffold> createState() => _ProfileAppScaffoldState();
}

class _ProfileAppScaffoldState extends State<ProfileAppScaffold> {
  final storage = const FlutterSecureStorage();
  String? token;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
    context.read<ProfileBloc>().add(const ProfileEvent.profileRequest());
  }

  _async() async{
    token = await storage.read(key: "token");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Colors.white,
      appBar: ProfileAppBar(),
      body: ProfilePage(),
    );
  }
}
