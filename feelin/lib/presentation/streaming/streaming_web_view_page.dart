import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/streaming/connect/connect_streaming_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../application/streaming/streaming_bloc.dart';
import '../style/colors.dart';

class StreamingWebViewPage extends StatefulWidget{
  final String url;
  final bool isApple;
  const StreamingWebViewPage({Key? key, required this.url, this.isApple = false}) : super(key: key);

  @override
  State<StreamingWebViewPage> createState() => _StreamingWebViewState();
}

class _StreamingWebViewState extends State<StreamingWebViewPage>{

  final storage = const FlutterSecureStorage();
  late WebViewController _controller;
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  var loadingPercentage = 0;

  late String id;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if(widget.isApple){
      id = Uri.parse(widget.url).queryParameters['id']??'';
    }
    if(!widget.isApple){
      timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) => _async());
    }
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if(await _controller.canGoBack()){
    _controller.goBack();
    return false;
    }else{
    return true;
    }
  }

  Future<void> _async() async {
    canGoBack = await _controller.canGoBack();
    if(mounted) {
      setState((){});
    }
  }

  bool canGoBack = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (widget.isApple || !canGoBack) ? null : (details) async {
        int sensitivity = 9;
        if (details.delta.dx > sensitivity) {
          _controller.goBack();
        }
      },
      child: WillPopScope(
        onWillPop: (widget.isApple || !canGoBack) ? null : _onWillPop,
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
                      if(widget.isApple){
                        Navigator.pop(context);
                      }else{
                        if(controller.hasData && await controller.data!.canGoBack()){
                          await controller.data!.goBack();
                        }else{
                          if(context.mounted) Navigator.pop(context);
                        }
                      }
                    },
                    color: Colors.black,
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
                      (f) => showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            icon: const Icon(Icons.music_note, color: Colors.transparent,),
                            backgroundColor: FeelinColorFamily.errorPrimary,
                              message: 'Connection failed.')
                      ),
                      (_) {
                        showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.success(
                                icon: Icon(Icons.music_note, color: Colors.transparent,),
                                message: 'Successfully connected.')
                        );
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                      context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                  },
                ),
              );
            },
            child: LayoutBuilder(
              builder: (context, constrains) {
                return SizedBox(
                  height: constrains.maxHeight,
                  child: Stack(
                    children: [
                      WebView(
                        initialUrl: widget.url,
                        javascriptMode: JavascriptMode.unrestricted,
                        userAgent: 'random',
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
                          if(request.url.startsWith('https://feelin-api.wafflestudio.com') || request.url.startsWith('https://feelin-api-dev.wafflestudio.com')){
                            showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                    icon: Icon(Icons.music_note, color: Colors.transparent,),
                                    // backgroundColor: FeelinColorFamily.redPrimary,
                                    message: 'Successfully connected.')
                            );
                            Navigator.pop(context, true);
                            Navigator.pop(context, true);
                            context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
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
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  JavascriptChannel _webToAppToken(BuildContext context){
    return JavascriptChannel(
        name: "flutterChannel",
        onMessageReceived: (JavascriptMessage message){
          context.read<ConnectStreamingBloc>().add(ConnectStreamingEvent.appleMusicLogin(message.message, id));
          Navigator.pop(context);
        });
  }

}