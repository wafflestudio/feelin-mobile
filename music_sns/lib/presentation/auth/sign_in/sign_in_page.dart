import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/injection.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: _loginForm(),
    ));
  }

  Widget _loginForm() {
    return BlocListener<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              (f) => _showSnackBar(context, f.toString()), // 로그인 실패
              (_) => null, // 로그인 성공
            ),
          );
        },
        child: Form(
          key: _formKey,
          child: Padding(
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

  Widget _idField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'ID 또는 이메일',
        ),
        validator: (_) =>
            context.read<SignInFormBloc>().state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => '올바른 형식의 이메일을 입력해 주세요.',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
        onChanged: (value) => context
            .read<SignInFormBloc>()
            .add(SignInFormEvent.emailChanged(value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.security),
          hintText: '비밀번호',
        ),
        validator: (_) =>
            context.read<SignInFormBloc>().state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => '비밀번호를 6자 이상 입력해 주세요.',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
        onChanged: (value) => context
            .read<SignInFormBloc>()
            .add(SignInFormEvent.passwordChanged(value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return state.isSubmitting
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.submitted());
                }
              },
              child: const Text('로그인'),
        style: ElevatedButton.styleFrom(primary: const Color.fromARGB(1, 193, 156, 1)),
            );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
