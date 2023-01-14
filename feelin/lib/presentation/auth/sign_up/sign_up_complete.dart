

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/streaming/connect_streaming_bloc.dart';

import '../../../application/auth/auth/auth_bloc.dart';
import '../../../injection.dart';
import '../../streaming/connect_streaming_page.dart';
import '../../style/colors.dart';
import 'common_title.dart';

class SignUpComplete extends StatelessWidget{
  const SignUpComplete({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 40,),
        const CommonTitle(title: 'All Complete! 🎉'),
        const Spacer(),
        _buttonCSS(context),
        const SizedBox(height: 20,),
        _laterButton(),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget _laterButton() {
    return Builder(
      builder: (context) {
        return InkWell(
            onTap: (){
              context.read<AuthBloc>()
                  .add(const AuthEvent.submitted());
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Center(
              child: Text(
                'Maybe later',
                style: TextStyle(
                  color: FeelinColorFamily.grayscaleGray2,
                  fontSize: 14,
                ),
              ),
            ));
      }
    );
  }

  Widget _buttonCSS(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: (){
            // 스트리밍 연동 페이지
            Navigator.push(context, CupertinoPageRoute(
              builder: (context){
                return BlocProvider(
                    create: (context) => getIt<ConnectStreamingBloc>(),
                    child: const ConnectStreamingPage());
              },
            ),
            );

          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )),
              backgroundColor: MaterialStateProperty.all(FeelinColorFamily.blueCore)
          ),
          child: const Center(
            child: Text(
              'Connect to streaming service',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}