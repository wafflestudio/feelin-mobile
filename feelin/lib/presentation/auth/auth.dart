import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in.dart';

import '../app/app.dart';
import '../app/my_key_store.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();

}
class _AuthState extends State<Auth> {
  @override
  void initState(){
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.submitted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          return state.initialLoading
              ? const Scaffold(body: Center(child: CupertinoActivityIndicator(radius: 20,)))
              : state.authenticated
              ? App(key: MyKeyStore.appKey,)
              : const SignIn();
        });
  }
}