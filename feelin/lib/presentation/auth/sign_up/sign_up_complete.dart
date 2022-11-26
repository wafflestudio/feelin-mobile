import 'package:flutter/material.dart';

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
        _buttonCSS(),
        const SizedBox(height: 20,),
        _laterButton(),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget _laterButton() {
    return ElevatedButton(
        onPressed: (){
          // 스트리밍 연동 페이지
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.transparent)
        ),
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

  Widget _buttonCSS(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: (){
            // 스트리밍 연동 페이지
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