import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart' as share_plus;

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
      print(e);
    });
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      _navigatePage(dynamicLinkData.link.path);
    }).onError((e) {
      print(e);
    });
  }

  void _navigatePage(String dynamicLink) {
    String postId = dynamicLink.split('/').last;
    // 페이지 이동
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) => MultiProvider(
    //       providers: [
    //         ChangeNotifierProvider(create: (_) => Posts(authProvider)),
    //         ChangeNotifierProvider(create: (_) => Messages(authProvider)),
    //       ],
    //       child: FutureBuilder(
    //         future: postProvider.getPost(int.parse(postId)),
    //         builder: (_, AsyncSnapshot<Post?> snapshot) {
    //           if (snapshot.hasData) {
    //             return PostDetail(post: snapshot.data);
    //           } else if (snapshot.hasError) {
    //             showToast(success: false, msg: '공유된 게시글을 찾을 수 없습니다.');
    //             Navigator.pop(context);
    //             return Container();
    //           } else {
    //             return Center(child: guamProgressIndicator());
    //           }
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }

  Future<String> _getShortLink(int id, String postTitle) async {
    String dynamicLinkPrefix = 'https://feelinsns.page.link';
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      // 수정 필요
      link: Uri.parse('https://feelin.wafflestudio.com/posts/$id'),
      androidParameters: const AndroidParameters(
        packageName: 'com.wafflestudio.music_sns',
        minimumVersion: 24,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: postTitle,
        imageUrl: Uri.parse("https://guam.wafflestudio.com/_next/static/media/favicon.e7a111af.svg"),
      ),
    );
    final unguessableDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.unguessable,
    );

    return unguessableDynamicLink.shortUrl.toString();
  }

  void share(int? id, String? postTitle) async{
    if(!isLoading){
      isLoading = true;
      share_plus.Share.share(
        await _getShortLink(id!, postTitle!),
      ).then((value) {
        Future.delayed(const Duration(milliseconds: 500),(){
          isLoading = false;
        });
      });
    }
  }
}
