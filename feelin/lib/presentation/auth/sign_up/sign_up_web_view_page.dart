
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignUpWebViewPage extends StatefulWidget{
  const SignUpWebViewPage({Key? key}) : super(key: key);

  @override
  State<SignUpWebViewPage> createState() => _SignUpWebViewState();
}

class _SignUpWebViewState extends State<SignUpWebViewPage>{

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
                  if(controller.hasData && await controller.data!.canGoBack()){
                    await controller.data!.goBack();
                  }else{
                    Navigator.pop(context);
                  }

                },
                color: Colors.grey,
                icon: const Icon(Icons.arrow_back_ios_new),
              );
            }
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: 'http://ec2-54-180-105-114.ap-northeast-2.compute.amazonaws.com/email-verify',
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
                },
                gestureNavigationEnabled: true,
              ),
              if (loadingPercentage < 100)
                LinearProgressIndicator(
                  value: loadingPercentage / 100.0,
                ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  JavascriptChannel _webToAppToken(BuildContext context){
    return JavascriptChannel(
        name: "Token",
        onMessageReceived: (JavascriptMessage message){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        });
  }

}