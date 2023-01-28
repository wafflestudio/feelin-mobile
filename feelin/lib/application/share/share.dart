import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:share_plus/share_plus.dart' as share_plus;

import '../../presentation/main/playlist_info/playlist_info_page.dart';
import '../info/playlist_info_bloc.dart';

class Share{
  BuildContext context;
  bool isLoading = false;

  Share({required this.context});

  Future<bool> initialize() async {
    bool dynamicLinkExists = await _getInitialLink();
    _addListener();

    return dynamicLinkExists;
  }

  Future<bool> _getInitialLink() async {
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      _navigatePage(initialLink.link.path);
      return true;
    }

    return false;
  }

  void addListener(Function function) {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      function();
    }).onError((e) {
      //print(e);
    });
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      _navigatePage(dynamicLinkData.link.path);
    }).onError((e) {
      //print(e);
    });
  }

  void _navigatePage(String dynamicLink) {
    String postId = dynamicLink.split('/').last;
    Navigator.push(context, CupertinoPageRoute(
      builder: (context){
        return BlocProvider(
            create: (context) => getIt<PlaylistInfoBloc>(),
            child: PlaylistInfoPage(post: null, postId: postId, heroNumber: 0, width: MediaQuery.of(context).size.width,));
      },
    ),
    );
  }

  Future<String> _getShortLink(String id, String postTitle, String thumbnail) async {
    String dynamicLinkPrefix = 'https://feelinsns.page.link';
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      link: Uri.parse('https://feelin.wafflestudio.com/posts/$id'),
      androidParameters: const AndroidParameters(
        packageName: 'com.wafflestudio.feelin',
        minimumVersion: 1,
      ),
      // TODO: ios parameter
      iosParameters: const IOSParameters(
        bundleId: 'com.wafflestudio.feelin',
        appStoreId: '1665350212',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: postTitle,
        imageUrl: Uri.parse(thumbnail),
      ),
    );
    final unguessableDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.unguessable,
    );

    return unguessableDynamicLink.shortUrl.toString();
  }

  void share(String id, String postTitle, String thumbnail) async{
    if(!isLoading){
      isLoading = true;
      share_plus.Share.share(
        await _getShortLink(id, postTitle, thumbnail),
      ).then((value) {
        Future.delayed(const Duration(milliseconds: 500),(){
          isLoading = false;
        });
      });
    }
  }
}
