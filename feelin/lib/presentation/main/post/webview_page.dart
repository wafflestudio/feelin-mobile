import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{
  final String url;
  const WebViewPage({Key? key, required this.url,}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> with AutomaticKeepAliveClientMixin{
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  var loadingPercentage = 0;

  late String id;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _completer.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
            //_controller.reload();
          },
          gestureNavigationEnabled: false,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}