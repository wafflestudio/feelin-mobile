import 'package:flutter/material.dart';
import 'package:music_sns/presentation/setting/setting_page.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../injection.dart';
import 'setting_app_bar.dart';

class SettingApp extends StatelessWidget {

  const SettingApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingAppScaffold();
    // return BlocProvider(create: (context) => getIt<SettingBloc>(),
    //   child: const SettingAppScaffold(),
    // );
  }
}

class SettingAppScaffold extends StatefulWidget {

  const SettingAppScaffold({Key? key}) : super(key: key);

  @override
  State<SettingAppScaffold> createState() => SettingAppScaffoldState();
}

class SettingAppScaffoldState extends State<SettingAppScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FeelinColorFamily.gray50,
      appBar: const SettingAppBar(),
      body: const SettingPage(),
    );
  }
}