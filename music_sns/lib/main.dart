import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_page.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_page.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';

void main() {
  runApp(const MyApp());
  configureInjection(Environment.prod);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feelin\'',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: const Color.fromARGB(1, 193, 156, 1),
        fontFamily: 'SpoqaHanSansNeo',
      ),
      home: PlaylistInfoPage(),
    );
  }
}
