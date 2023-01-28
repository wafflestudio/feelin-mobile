import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_email.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_phone.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool withEmail = false;

  void toggleMethod() => setState(() {
    withEmail = !withEmail;
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
            child: BlocProvider(
              create: (context) => getIt<SignInFormBloc>(),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: Builder(builder: (BuildContext context){
                  if(withEmail) {
                    return SignInEmail(toggleMethod: toggleMethod);
                  } else {
                    return SignInPhone(toggleMethod: toggleMethod);
                  }
                }),
              ),
            )
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
