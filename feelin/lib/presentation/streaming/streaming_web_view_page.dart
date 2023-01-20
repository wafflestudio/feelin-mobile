import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/streaming/connect_streaming_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../style/colors.dart';

class StreamingWebViewPage extends StatefulWidget{
  final String url;
  final bool isApple;
  const StreamingWebViewPage({Key? key, required this.url, this.isApple = false}) : super(key: key);

  @override
  State<StreamingWebViewPage> createState() => _SignUpWebViewState();
}

class _SignUpWebViewState extends State<StreamingWebViewPage>{

  final storage = const FlutterSecureStorage();
  late WebViewController _controller;
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  var loadingPercentage = 0;

  late String id;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if(widget.isApple){
      id = Uri.parse(widget.url).queryParameters['id']??'';
      print(Uri.parse(widget.url).queryParameters['id']??'');
    }
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
                    //_controller.runJavascript('sendToFlutter()');
                  },
                  color: Colors.grey,
                  icon: const Icon(Icons.arrow_back_ios_new),
                );
              }
          ),
        ),
        body: BlocListener<ConnectStreamingBloc, ConnectStreamingState>(
          listener: (context, state){
            state.requestFailureOrSuccessOption.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                    (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: FeelinColorFamily.errorPrimary,
                      content: const Text('Connection failed.'),
                    )),
                    (_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: FeelinColorFamily.redPrimary,
                    content: const Text('Successfully connected.'),
                    ));
                    Navigator.pop(context);
                },
              ),
            );
          },
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
                      navigationDelegate: (request){
                        print(request);
                        if(request.url.startsWith('https://feelin-api-dev.wafflestudio.com')){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: FeelinColorFamily.redPrimary,
                            content: const Text('Successfully connected.'),
                          ));
                          Navigator.pop(context);
                        }
                        return NavigationDecision.navigate;
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
          print(message.message);
          context.read<ConnectStreamingBloc>().add(ConnectStreamingEvent.appleMusicLogin(message.message, id));
          Navigator.pop(context);
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(message.message)));
          // storage.write(key: "token", value: message.message);
          // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context){
          //   return const RootPage();
          // }),(route) => false);
        });
  }

}