import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/auth/login/auth_repository.dart';
import 'package:music_sns/auth/login/form_submission_status.dart';
import 'package:music_sns/auth/login/login_bloc.dart';
import 'package:music_sns/auth/login/login_event.dart';
import 'package:music_sns/auth/login/login_state.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepository: context.read<AuthRepository>()
        ),
        child: _loginForm(),
      )
    );
  }

  Widget _loginForm(){
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      final formState = state.formSubmissionStatus;
      if(formState is SubmissionFailed){
        _showSnackBar(context, formState.exception.toString());
      }
    },
    child : Form(
      key: _formKey,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _idField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    ));
  }

  Widget _idField(){
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'id or email',
        ),
        validator: (value) => state.isValidId ? null : '아이디를 입력해주세요.',
        onChanged: (value) => context.read<LoginBloc>().add(
          LoginIdChanged(id: value),
        ),
      );
    });
  }

  Widget _passwordField(){
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state)
    {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.security),
          hintText: 'password',
        ),
        validator: (value) => state.isValidPassword ? null : '비밀번호는 6자 이상입니다.',
        onChanged: (value) => context.read<LoginBloc>().add(
          LoginPasswordChanged(password: value),
        ),
      );
    });
  }

  Widget _loginButton(){
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return state.formSubmissionStatus is FormSubmitting ? CircularProgressIndicator()
        : ElevatedButton(onPressed: (){
          if(_formKey.currentState!.validate()) {
            context.read<LoginBloc>().add(LoginSubmitted());
          }
    },
        child: Text('Login'));
    });
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}