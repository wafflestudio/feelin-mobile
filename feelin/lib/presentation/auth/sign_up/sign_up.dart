import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_code.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_name.dart';

import 'sign_up_app_bar.dart';

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
      if(_currPage == 4 || _currPage == 5){
        context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
      }
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
      child: Scaffold(
        appBar: const SignUpAppBar(),
        body: SafeArea(
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Builder(
              builder: (context) {
                if(_currPage == 1) return SignUpCode(goToNext: goToNext,);
                if(_currPage == 2) return const SignUpName();
                return Container();
              }
            )
          ),
        ),
      ),
    );
  }

}