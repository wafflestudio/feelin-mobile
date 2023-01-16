import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth/auth_bloc.dart';
import '../../style/colors.dart';
import '../sign_up/sign_up.dart';

class SignUpButton extends StatelessWidget {

  const SignUpButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context){
          return BlocProvider(create: (context) => context.read<AuthBloc>(), child: const SignUp());
        }));
      }
      ,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0.0),
        minimumSize: MaterialStateProperty.all(const Size(250,50)),
        foregroundColor: MaterialStateProperty.all(FeelinColorFamily.red500),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: const Text(
        "Create new account",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}