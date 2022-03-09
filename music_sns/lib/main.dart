import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
  configureInjection(Environment.prod);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
