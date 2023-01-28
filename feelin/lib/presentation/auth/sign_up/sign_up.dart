import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_code.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_name.dart';

import 'sign_up_app_bar.dart';
import 'sign_up_birthday.dart';
import 'sign_up_password.dart';
import 'sign_up_username.dart';

class SignUp extends StatefulWidget{
  final bool withEmail;
  final String email;
  final String phoneNumber;
  final String countryCode;
  const SignUp({Key? key, required this.withEmail, this.email = '', this.phoneNumber = '', this.countryCode = ''}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  int _currPage = 1;

  void goToNext() => setState(() {
    _currPage++;
  });

  void goToPrevious() => setState(() {
    if(_currPage <= 2){
      Navigator.pop(context);
    }else{
      setState(() {
        _currPage --;
      });
    }
  });

  @override
  void initState(){
    super.initState();
    if(widget.withEmail){
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.setEmail());
      context.read<SignUpFormBloc>().add(SignUpFormEvent.emailAddressChanged(widget.email));
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.emailRequested());
    }else{
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.setPhone());
      context.read<SignUpFormBloc>().add(SignUpFormEvent.phoneNumberChanged(widget.phoneNumber));
      context.read<SignUpFormBloc>().add(SignUpFormEvent.countryCodeChanged(widget.countryCode));
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.phoneRequested());
    }
  }

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
          appBar: SignUpAppBar(goToBack: goToPrevious),
          body: SafeArea(
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: Builder(
                builder: (context) {
                  if(_currPage == 1) return SignUpCode(goToNext: goToNext,);
                  if(_currPage == 2) return SignUpName(goToNext: goToNext,);
                  if(_currPage == 3) return SignUpBirthday(goToNext: goToNext,);
                  if(_currPage == 4) return SignUpUsername(goToNext: goToNext,);
                  if(_currPage == 5) return SignUpPassword(goToNext: goToNext,);
                  return Container();
                }
              )
            ),
          ),
        ),
      ),
    );
  }

}