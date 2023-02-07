import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/application/streaming/streaming_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/style/colors.dart';

import 'env.dart';
import 'firebase_options.dart';
import 'infrastructure/auth/navigation_service.dart';
import 'presentation/auth/auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Use platform channels to call native code to initialize Firebase.
  // Thus, 'async' main() and placed next to ensureInitialized()
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // for prod environment
  BuildEnvironment.init(
      flavor: BuildFlavor.production,
    socialBaseUrl: 'https://feelin-social-api.wafflestudio.com/api/v1',
    coreBaseUrl: 'https://feelin-api.wafflestudio.com/api/v1',
  );
  assert(env != null);

  // for dev environment
  // BuildEnvironment.init(
  //   flavor: BuildFlavor.development,
  //   socialBaseUrl: 'https://feelin-social-api-dev.wafflestudio.com/api/v1',
  //   coreBaseUrl: 'https://feelin-api-dev.wafflestudio.com/api/v1',
  // );
  // assert(env != null);

  runApp(const MyApp());
  configureInjection(Environment.prod);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<StreamingBloc>()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Feelin\'',
        theme: ThemeData(
          primaryColor: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            )
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              }
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(FeelinColorFamily.gray200)
            )
          ),
          snackBarTheme: SnackBarThemeData(backgroundColor: FeelinColorFamily.errorPrimary, actionTextColor: Colors.white),
          inputDecorationTheme: InputDecorationTheme(
            border: UnderlineInputBorder(borderSide: BorderSide(color: FeelinColorFamily.gray600, width: 1),),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: FeelinColorFamily.gray900, width: 1),),
            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: FeelinColorFamily.errorPrimary, width: 1),),
            contentPadding: const EdgeInsets.all(10),
            hintStyle: TextStyle(color: FeelinColorFamily.gray500)
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: FeelinColorFamily.redSecondary,
            selectionHandleColor: FeelinColorFamily.redPrimary,
          ),
          appBarTheme: const AppBarTheme(foregroundColor: Colors.black,),
          fontFamily: 'Pretendard',
          scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(0xFFFFFFFF, <int, Color>{
            50: FeelinColorFamily.red50,
            100: FeelinColorFamily.red100,
            200: FeelinColorFamily.red200,
            300: FeelinColorFamily.red300,
            400: FeelinColorFamily.red400,
            500: FeelinColorFamily.red500,
            600: FeelinColorFamily.red600,
            700: FeelinColorFamily.red700,
            800: FeelinColorFamily.red800,
            900: FeelinColorFamily.red900,
          })).copyWith(error: FeelinColorFamily.errorPrimary),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Auth(),
        },
      ),
    );
  }
}