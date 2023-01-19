import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'common_description.dart';
import 'common_title.dart';

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
    return BlocListener<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
      state.verifyFailureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
                (f) => setState(() => hasError = true), // 인증 실패
                (_) => {
              widget.goToNext() // 인증 성공
            }

        ),
      );
    },
    child : PinCodeTextField(
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
            shape: PinCodeFieldShape.underline,
            borderWidth: 2,
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            inactiveFillColor: Colors.transparent,
            activeColor: hasError ? FeelinColorFamily.errorPrimary : Colors.black,
            selectedColor: Colors.black,
            inactiveColor: FeelinColorFamily.grayscaleGray1,
            errorBorderColor: FeelinColorFamily.errorPrimary,

          ),
          showCursor: false,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          keyboardType: TextInputType.number,

          onCompleted: (v) {
            // 코드 인증 요청
            context
                .read<SignUpFormBloc>()
                .add(const SignUpFormEvent.emailSubmitted());
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            debugPrint(value);
            context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.codeChanged(value));
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
        )
    );
  }


}