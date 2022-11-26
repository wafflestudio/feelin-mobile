import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/application/navigation/navigation_cubit.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_page.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_page.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';
import 'package:music_sns/presentation/main/profile/profile_page.dart';
import 'package:music_sns/presentation/main/root_page.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Use platform channels to call native code to initialize Firebase.
  // Thus, 'async' main() and placed next to ensureInitialized()
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  configureInjection(Environment.prod);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        title: 'Feelin\'',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          primaryColor: const Color.fromARGB(1, 193, 156, 1),
          fontFamily: 'SpoqaHanSansNeo',
        ),
        home: const SignInPage(),
      ),
    );
  }
}
