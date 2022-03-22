import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/injection.dart';

class SignInPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (context) => getIt<SignInFormBloc>(),
              child: _loginForm(screenSize),),
            _signUpButton(),
          ]),
        )
    );
  }

  Widget _loginForm(Size size) {
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
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            width: size.width,
            height: 540,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Flexible(child: _idField())),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Flexible(child: _passwordField())),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Flexible(child: _loginButton(size))),
              ],
            ),
          ),
        ));
  }

  Widget _idField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return SizedBox(
        width: 257,
        height: 22,
        child: TextFormField(
          controller: _idTextController,
          decoration: const InputDecoration(
            hintText: 'ID 또는 이메일',
          ),
          validator: (_) =>
              context.read<SignInFormBloc>().state.emailAddress.value.fold(
                    (f) => f.maybeMap(
                      invalidEmail: (_) => null, //'올바른 형식의 이메일을 입력해 주세요.',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          onChanged: (value) => context
              .read<SignInFormBloc>()
              .add(SignInFormEvent.emailChanged(value)),
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return SizedBox(
        width: 257,
        height: 22,
        child: TextFormField(
          controller: _passwordTextController,
          obscureText: true,
          obscuringCharacter: '●', // <- 크롬에서 문자가 깨짐
          decoration: const InputDecoration(
            hintText: '비밀번호',
          ),
          validator: (_) =>
              context.read<SignInFormBloc>().state.password.value.fold(
                    (f) => f.maybeMap(
                      shortPassword: (_) => null, //'비밀번호를 6자 이상 입력해 주세요.',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          onChanged: (value) => context
              .read<SignInFormBloc>()
              .add(SignInFormEvent.passwordChanged(value)),
        ),
      );
    });
  }

  Widget _loginButton(Size size) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return state.isSubmitting
          ? const CircularProgressIndicator()
          : SizedBox(
            width: 257,
            height: 38,
            child: ElevatedButton(
                onPressed: (_idTextController.text.isNotEmpty && _passwordTextController.text.isNotEmpty)? () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.submitted());
                  }
                } : null,
                child: const Text('로그인', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
            backgroundColor: MaterialStateProperty.resolveWith((states){
             if(states.contains(MaterialState.disabled)){
               return const Color(0xff7DD8C6);
             }
             if(states.contains(MaterialState.pressed)) {
               return const Color(0xff008E73);
             }
             return const Color(0xff00C19C);
        }),
            foregroundColor: MaterialStateProperty.all(Colors.white)
        ),
              ),
          );
    });
  }

  Widget _signUpButton() {
    return Container(
      width: 257,
      height: 38,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          colors: <Color>[
            Color(0xff00C19C),
            Color(0xff7077D5),
          ],
          stops: <double>[0.0,1.0],
          tileMode: TileMode.clamp
        )
      ),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(2),
        child: OutlinedButton(
          onPressed: () {}//TODO: implement to enter signup page
            ,
          child: const Text("회원가입",),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
              foregroundColor: MaterialStateProperty.resolveWith((states){
            if(states.contains(MaterialState.pressed)){
              return Colors.white;
            }
            return Colors.black;
          }),
              textStyle: MaterialStateProperty.resolveWith((states){
                if(states.contains(MaterialState.pressed)){
                  return const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13);
                }
                return const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13);
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states){
                if(states.contains(MaterialState.pressed)){
                  return Colors.transparent;
                }
                return Colors.white;
              }))
        ),
      ));
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

