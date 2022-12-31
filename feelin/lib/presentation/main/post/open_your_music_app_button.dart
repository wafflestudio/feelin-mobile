import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OpenYourMusicAppButton extends StatelessWidget{
  final storage = const FlutterSecureStorage();
  final Size size;

  const OpenYourMusicAppButton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.20),
      width: double.infinity,
      height: 38,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            colors: <Color>[
              Color(0xff00C19C),
              Color(0xff7077D5),
            ],
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(2),
        child: OutlinedButton(
          onPressed: () {
            //TODO: open user's Music Platform App.
            openMusicApp();
          }
          ,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.black;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  );
                }
                return const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                );
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.transparent;
                }
                return Colors.white;
              },
            ),
          ),
          child: const Text(
            "내 플레이리스트 찾기",
          ),
        ),
      ),
    );
  }

  void openMusicApp() async {
    final myMusicPlatform = await storage.read(key: 'MusicPlatform');
    switch(myMusicPlatform){
      case 'Flo': {
        LaunchApp.openApp(
          androidPackageName: 'skplanet.musicmate',
          iosUrlScheme: '',
          appStoreLink: 'https://apps.apple.com/kr/app/flo-%ED%94%8C%EB%A1%9C/id1129048043',
          openStore: true,
        );
      }
      break;
      case 'Spotify': {
        LaunchApp.openApp(
          androidPackageName: 'com.spotify.music',
          iosUrlScheme: 'spotify://',
          appStoreLink: 'https://apps.apple.com/kr/app/spotify-%EC%8A%A4%ED%8F%AC%ED%8B%B0%ED%8C%8C%EC%9D%B4/id324684580',
          openStore: true,
        );
      }
      break;
      case 'Vive': {
        LaunchApp.openApp(
          androidPackageName: 'com.naver.vibe',
          iosUrlScheme: '',
          appStoreLink: 'https://apps.apple.com/kr/app/naver-vibe-%EB%B0%94%EC%9D%B4%EB%B8%8C/id1338631589',
          openStore: true,
        );
      }
      break;
      case 'YTMusic': {
        LaunchApp.openApp(
          androidPackageName: 'com.google.android.apps.youtube.music',
          iosUrlScheme: 'youtubemusic://',
          appStoreLink: 'https://apps.apple.com/kr/app/youtube-music/id1017492454',
          openStore: true,
        );
      }
      break;
      case 'Melon': {
        LaunchApp.openApp(
          androidPackageName: 'com.iloen.melon',
          iosUrlScheme: 'fb329785880437397://',
          appStoreLink: 'https://apps.apple.com/kr/app/%EB%A9%9C%EB%A1%A0-melon/id415597317',
          openStore: true,
        );
      }
      break;
      case 'Genie': {
        LaunchApp.openApp(
          androidPackageName: 'com.ktmusic.geniemusic',
          iosUrlScheme: '',
          appStoreLink: 'https://apps.apple.com/kr/app/%EC%A7%80%EB%8B%88%EB%AE%A4%EC%A7%81-genie/id858266085',
          openStore: true,
        );
      }
      break;
      case 'Bugs': {
        LaunchApp.openApp(
          androidPackageName: 'com.neowiz.android.bugs',
          iosUrlScheme: '',
          appStoreLink: 'https://apps.apple.com/kr/app/%EB%B2%85%EC%8A%A4-bugs/id348555322',
          openStore: true,
        );
      }
      break;
      case 'AppleMusic': {
        LaunchApp.openApp(
          androidPackageName: 'com.apple.android.music',
          iosUrlScheme: '',
          appStoreLink: 'https://apps.apple.com/kr/app/apple-music/id1108187390',
          openStore: true,
        );
      }
    }
  }

}