import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/auth/auth_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_up_button.dart';

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

  final focusNode = FocusNode();

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
          child: SizedBox(
            height: 680,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }

  Widget _divider(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
            (f) => null //f.maybeMap(orElse: ()=>_showSnackBar(context, 'server error'))
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
            mainAxisSize: MainAxisSize.min,
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
                height: 50,
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
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          focusNode.requestFocus();
        },
        decoration: InputDecoration(
          hintText: 'Phone number, username or email',
          isDense: true,
          //fillColor: _idTextController.text == '' ? FeelinColorFamily.grayscaleGray3 : Colors.white,
          hoverColor: Colors.transparent,
          //filled: true,
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
        focusNode: focusNode,
        onFieldSubmitted: (_){
          if(_idTextController.text.isNotEmpty &&
              _passwordTextController.text.isNotEmpty){
            if (_formKey.currentState!.validate()) {
              context
                  .read<SignInFormBloc>()
                  .add(const SignInFormEvent.submitted());
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }
        },
        obscureText: true,
        obscuringCharacter: '*', // <- 크롬에서 문자가 깨짐
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: 'Password',
            isDense: true,

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
                        borderRadius: BorderRadius.circular(28)
                    )),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.resolveWith((states){
                      if (states.contains(MaterialState.disabled)) {
                        return FeelinColorFamily.gray400;
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black;
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
