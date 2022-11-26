import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'common_description.dart';
import 'common_title.dart';
import 'next_button.dart';

class SignUpCode extends StatefulWidget{
  final Map input;
  final Function goToNext;
  const SignUpCode({Key? key, required this.input, required this.goToNext}) : super(key: key);

  @override
  State<SignUpCode> createState() => _SignUpCodeState();

}
class _SignUpCodeState extends State<SignUpCode>{

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CommonTitle(title: 'Enter the confirmation code'),
        const SizedBox(height: 10,),
        const CommonDescription(description: 'We\'ll send you a verification code',),
        const SizedBox(height: 30,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _codeField()
        ),
      ],
    );
  }

  Widget _codeField() {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: FeelinColorFamily.grayscaleGray1,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      autoFocus: true,
      errorAnimationDuration: 0,
      obscureText: false,
      backgroundColor: Colors.transparent,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if(hasError) return '';
        return null;
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        borderWidth: 1,
        fieldHeight: 48,
        fieldWidth: 48,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
        activeColor: hasError ? FeelinColorFamily.redCore : FeelinColorFamily.grayscaleGray1,
        selectedColor: FeelinColorFamily.blueCore,
        inactiveColor: FeelinColorFamily.grayscaleGray1,
        errorBorderColor: FeelinColorFamily.redCore,

      ),
      showCursor: false,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,

      onCompleted: (v) {
        // 코드 인증 요청
        if(v == '123456'){
          widget.goToNext();
        }else{
          setState((){hasError = true;});

        }
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          hasError = false;
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }


}