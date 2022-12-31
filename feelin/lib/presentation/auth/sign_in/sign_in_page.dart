import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_up_button.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_web_view_page.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';
import 'package:music_sns/presentation/main/profile/profile_page.dart';

import '../../main/root_page.dart';
import '../../style/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  void dispose() {
    _idTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (context) => getIt<SignInFormBloc>(),
                child: _loginForm(screenSize),
              ),
              _divider(),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(color: FeelinColorFamily.grayDivider, width: 150, height: 0.25,),
          Text('OR', style: TextStyle(fontSize: 13, color: FeelinColorFamily.grayscaleGray2, fontWeight: FontWeight.w600),),
          Container(color: FeelinColorFamily.grayDivider, width: 150, height: 0.25,),
        ],
      ),
    );
  }

  Widget _loginForm(Size size) {
    return BlocListener<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (failureOrSuccess) => failureOrSuccess.fold(
            (f) => null
              //_showSnackBar(context, f.toString())
              , // 로그인 실패
            (_) => {
            context.read<AuthBloc>()
                .add(const AuthEvent.submitted()), // 로그인 성공
            }
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(top: 100, bottom: 40),
          width: size.width,
          height: size.height*0.5,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 48,
                child: _idField(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                height: 70,
                child: _passwordField(),
              ),
              const SizedBox(
                height: 62,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 48,
                child: _loginButton(size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _idField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return TextFormField(
        controller: _idTextController,
        decoration: InputDecoration(
          hintText: 'Phone number, username or email',
          isDense: true,
          fillColor: _idTextController.text == '' ? FeelinColorFamily.grayscaleGray3 : Colors.white,
          hoverColor: Colors.transparent,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: FeelinColorFamily.blueCore, width: 0.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
        ),
        validator: (_) =>
            context.read<SignInFormBloc>().state.account.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => null, //'올바른 형식의 이메일을 입력해 주세요.',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
        onChanged: (value) => context
            .read<SignInFormBloc>()
            .add(SignInFormEvent.accountChanged(value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return TextFormField(
        controller: _passwordTextController,
        obscureText: true,
        obscuringCharacter: '*', // <- 크롬에서 문자가 깨짐
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: 'Password',
            isDense: true,
            fillColor: _passwordTextController.text == '' ? FeelinColorFamily.grayscaleGray3 : Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: FeelinColorFamily.blueCore, width: 0.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.red, width: 0.5),
            ),
        ),
        validator: (_) => state.authFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                    (f) => f.maybeMap(
                  invalidEmailAndPasswordCombination: (_) => 'The account or password do not match',
                  orElse: () => null,),
                    (token) => null
            )
        ),
        onChanged: (value) => context
            .read<SignInFormBloc>()
            .add(SignInFormEvent.passwordChanged(value)),
      );
    });
  }

  Widget _loginButton(Size size) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: (_idTextController.text.isNotEmpty &&
                        _passwordTextController.text.isNotEmpty)
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<SignInFormBloc>()
                              .add(const SignInFormEvent.submitted());
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      }
                    : null,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    )),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.resolveWith((states){
                      if (states.contains(MaterialState.disabled)) {
                        return FeelinColorFamily.grayscaleGray1;
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return FeelinColorFamily.blueCore;
                      }
                      return FeelinColorFamily.blueCore;
                    })
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
