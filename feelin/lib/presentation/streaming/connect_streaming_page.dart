
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/streaming/connect_streaming_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/streaming/platform_button.dart';
import 'package:music_sns/presentation/streaming/streaming_web_view_page.dart';

import '../auth/sign_up/common_title.dart';
import '../style/colors.dart';

class ConnectStreamingPage extends StatelessWidget{

  ConnectStreamingPage({Key? key,}) : super(key: key);

  bool navigated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            const CommonTitle(title: 'Connect with your favorite streaming services'),
            _selectPlatform(),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget _selectPlatform(){
    return BlocListener<ConnectStreamingBloc, ConnectStreamingState>(
      listener: (context, state){
        state.urlRequestFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => _showSnackBar(context, f.toString()),
                  (url){
                    if(!navigated){
                      final bloc = context.read<ConnectStreamingBloc>();
                      navigated = true;
                      Navigator.push(context,
                        CupertinoPageRoute(
                          builder: (context){
                            return BlocProvider(
                                create: (context) => bloc,
                                child: StreamingWebViewPage(url: url.url, isApple: true,),
                            );
                          },
                        ),
                      );
                    }

                    // showCupertinoModalBottomSheet(
                    //   context: context,
                    //   builder: (context) => StreamingWebViewPage(url: url.url),
                    // ), // 로그인 성공
              }
          ),
        );
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
              //Navigator.pop(context);
            },
          ),

        );
      },
      child: BlocBuilder<ConnectStreamingBloc, ConnectStreamingState>(
        builder: (context, state) {
          return Column(
            children: [
              PlatformButton(function: (){
                if(!state.isSubmitting){
                  navigated = false;
                  context
                      .read<ConnectStreamingBloc>()
                      .add(const ConnectStreamingEvent.requestLogin('spotify'));
                }
              }, label: 'Connect to Spotify', icon: const Icon(Icons.library_music)),
              PlatformButton(function: (){
                if(!state.isSubmitting){
                  navigated = false;
                  context
                      .read<ConnectStreamingBloc>()
                      .add(const ConnectStreamingEvent.requestLogin('applemusic'));
                }
              }, label: 'Connect to Apple Music', icon: const Icon(Icons.library_music)),
            ],
          );
        }
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
