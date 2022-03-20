import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/auth/login/login_page.dart';
import 'package:music_sns/auth/login/auth_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feelin\'',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(1, 193, 156, 1),
        fontFamily: 'SpoqaHanSansNeo',

      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginPage(),
      ),
    );
  }
}




