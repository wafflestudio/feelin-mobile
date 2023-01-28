
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/streaming/connect/connect_streaming_bloc.dart';
import 'package:music_sns/application/streaming/streaming_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/common_description.dart';
import 'package:music_sns/presentation/streaming/platform_button.dart';
import 'package:music_sns/presentation/streaming/streaming_web_view_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../auth/sign_up/common_title.dart';
import '../setting/our_email_page.dart';
import '../style/colors.dart';

class ConnectStreamingPage extends StatefulWidget{

  const ConnectStreamingPage({Key? key,}) : super(key: key);

  @override
  State<ConnectStreamingPage> createState() => _ConnectStreamingPageState();
}

class _ConnectStreamingPageState extends State<ConnectStreamingPage>{

  bool navigated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              const CommonTitle(title: 'Connect to your \nstreaming account'),
              const SizedBox(height: 10,),
              const CommonDescription(description: 'Save and share playlists \non your streaming account with ease'),
              const SizedBox(height: 30,),
              _selectPlatform(),
              const SizedBox(height: 50,),
              _divider(),
              const SizedBox(height: 50,),
              _contactButton(),
              const SizedBox(height: 100,),
              _laterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactButton(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context){
            return const OurEmailPage();
          },
        ),
        );
      },
      child: SizedBox(
        height: 20,
        child: Text(
          'Can’t find your streaming service on the list?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: FeelinColorFamily.red500,
          ),
        ),
      ),
    );
  }
  Widget _laterButton() {
    return Builder(
        builder: (context) {
          return InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Maybe later',
                  style: TextStyle(
                    color: FeelinColorFamily.gray700,
                    fontSize: 14,
                  ),
                ),
              ));
        }
    );
  }

  Widget _divider(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(color: FeelinColorFamily.gray700, width: 150, height: 0.25,),
          Text('OR', style: TextStyle(fontSize: 13, color: FeelinColorFamily.gray700, fontWeight: FontWeight.w600),),
          Container(color: FeelinColorFamily.gray700, width: 150, height: 0.25,),
        ],
      ),
    );
  }

  Widget _selectPlatform(){
    return BlocListener<ConnectStreamingBloc, ConnectStreamingState>(
      listener: (context, state){
        state.urlRequestFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => f.maybeMap(
                      serverError: (_)=>showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(message: 'Server Error')
                      ),
                      alreadyConnected: (_){
                        showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(message: 'Your account is already connected.')
                        );
                        Navigator.pop(context);
                        },
                      orElse: ()=>showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(message: f.toString())
                  )),
                  (url){
                    if(!navigated){
                      final bloc = context.read<ConnectStreamingBloc>();
                      navigated = true;
                      Navigator.push(context,
                        CupertinoPageRoute(
                          builder: (context){
                            return BlocProvider.value(
                                value: bloc,
                                child: StreamingWebViewPage(url: url.url, isApple: true,),
                            );
                          },
                        ),
                      ).then((value) {
                        if(value != null){
                          context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                        }
                      });
                    }

                    // showCupertinoModalBottomSheet(
                    //   context: context,
                    //   builder: (context) => StreamingWebViewPage(url: url.url),
                    // ), // 로그인 성공
              }
          ),
        );
        // state.requestFailureOrSuccessOption.fold(
        //       () => null,
        //       (failureOrSuccess) => failureOrSuccess.fold(
        //         (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       backgroundColor: FeelinColorFamily.errorPrimary,
        //       content: const Text('Connection failed.'),
        //     )),
        //         (_) {
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //         backgroundColor: FeelinColorFamily.redPrimary,
        //         content: const Text('Successfully connected.'),
        //       ));
        //       Navigator.pop(context, true);
        //       Navigator.pop(context, true);
        //       context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
        //     },
        //   ),
        //
        // );
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
              }, label: 'Connect to Spotify', icon: SvgPicture.asset('assets/icons/spotify_icon.svg',
                width: 32,
                height: 32,
              )),
              const SizedBox(height: 8,),
              PlatformButton(function: (){
                if(!state.isSubmitting){
                  navigated = false;
                  context
                      .read<ConnectStreamingBloc>()
                      .add(const ConnectStreamingEvent.requestLogin('applemusic'));
                }
              }, label: 'Connect to Apple Music',
                  icon: Image.asset('assets/icons/apple_music_icon.png',
                width: 32,
                height: 32,
              ),),
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
