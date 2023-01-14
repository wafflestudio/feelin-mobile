import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamingWebViewPage extends StatefulWidget{
  final String url;
  const StreamingWebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<StreamingWebViewPage> createState() => _SignUpWebViewState();
}

class _SignUpWebViewState extends State<StreamingWebViewPage>{

  final storage = const FlutterSecureStorage();
  late WebViewController _controller;
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(await _controller.canGoBack()){
          _controller.goBack();
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(''),
          leading: FutureBuilder<WebViewController>(
              future: _completer.future,
              builder: (context, AsyncSnapshot<WebViewController> controller) {
                return IconButton(
                  onPressed: () async{
                    // if(controller.hasData && await controller.data!.canGoBack()){
                    //   await controller.data!.goBack();
                    // }else{
                    //   Navigator.pop(context);
                    // }
                    _controller.runJavascript('sendToFlutter()');
                  },
                  color: Colors.grey,
                  icon: const Icon(Icons.arrow_back_ios_new),
                );
              }
          ),
        ),
        body: Container(
          child: LayoutBuilder(
            builder: (context, constrains) {
              return Container(
                height: constrains.maxHeight,
                child: Container(
                child: Stack(
                  children: [
                    WebView(
                      initialUrl: widget.url,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController){
                        _completer.future.then((value) => _controller = value);
                        _completer.complete(webViewController);
                      },
                      javascriptChannels: <JavascriptChannel>{
                        _webToAppToken(context),
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
                      gestureNavigationEnabled: true,
                    ),
                    if (loadingPercentage < 100)
                      LinearProgressIndicator(
                        value: loadingPercentage / 100.0,
                      ),
                  ],
                ),
              ),);
            }
          ),
        ),
      ),
    );
  }

  JavascriptChannel _webToAppToken(BuildContext context){
    return JavascriptChannel(
        name: "flutterChannel",
        onMessageReceived: (JavascriptMessage message){
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(message.message)));
          // storage.write(key: "token", value: message.message);
          // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context){
          //   return const RootPage();
          // }),(route) => false);
        });
  }

}