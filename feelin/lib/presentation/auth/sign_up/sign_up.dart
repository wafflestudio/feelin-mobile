import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_code.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_complete.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_email.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_name.dart';

import '../../../injection.dart';
import 'sign_up_app_bar.dart';
import 'sign_up_birthday.dart';
import 'sign_up_password.dart';
import 'sign_up_phone.dart';
import 'sign_up_username.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  final Map<String, String> input = {
    'email' : '',
    'password' : '',
    'name' : '',
    'username' : '',
    'birth': '',
    'phoneNumber': '',
  };

  int _currPage = 1;
  bool withEmail = false;

  void goToNext() => setState(() {
    _currPage++;
  });

  void goToPrevious() => setState(() {
    _currPage--;
  });

  void toggleMethod() => setState(() {
    withEmail = !withEmail;
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: (){
          if(_currPage == 1){
            return Future.value(true);
          }else{
            setState(() {
              _currPage --;
            });

            return Future.value(false);
          }
        },
        child: Scaffold(
          appBar: SignUpAppBar(goToBack: (){
            if(_currPage == 1){
              Navigator.pop(context);
            }else{
              setState(() {
                _currPage --;
              });
            }
          }),
          body: SafeArea(
            child: BlocProvider(
              create: (context) => getIt<SignUpFormBloc>(),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: Builder(builder: (BuildContext context){
                  if(_currPage == 1) return SignUpName(input: input, goToNext: goToNext,);
                  if(_currPage == 2 && !withEmail) return SignUpPhone(input: input, goToNext: goToNext, toggleMethod: toggleMethod,);
                  if(_currPage == 2 && withEmail) return SignUpEmail(input: input, goToNext: goToNext, toggleMethod: toggleMethod,);
                  if(_currPage == 3) return SignUpCode(input: input, goToNext: goToNext);
                  if(_currPage == 4) return SignUpBirthday(input: input, goToNext: goToNext);
                  if(_currPage == 5) return SignUpUsername(input: input, goToNext: goToNext);
                  if(_currPage == 6) return SignUpPassword(input: input, goToNext: goToNext);
                  if(_currPage == 7) return const SignUpComplete();
                  return Container();
                })
              ),
            ),
          ),
        ),
      ),
    );
  }

}