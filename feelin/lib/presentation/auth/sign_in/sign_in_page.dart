import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_up/email_authentication_page.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_page.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_web_view_page.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';
import 'package:music_sns/presentation/main/profile/profile_page.dart';

import '../../main/root_page.dart';

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
              _signUpButton(),
            ],
          ),
        ),
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
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context){
                return const RootPage();
              }),(route) => false), // 로그인 성공
            }

          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(top: 150),
          width: size.width,
          height: size.height*0.6,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 6,
                ),
                child: _idField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 6,
                ),
                child: _passwordField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 20,
                ),
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
        decoration: const InputDecoration(
          hintText: '아이디 또는 이메일 또는 전화번호',
          isDense: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff7DD8C6),
            ),
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
        obscuringCharacter: '●', // <- 크롬에서 문자가 깨짐
        decoration: const InputDecoration(
          isDense: true,
          hintText: '비밀번호',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff7DD8C6),
            ),
          ),
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
              height: 38,
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
                  shape: MaterialStateProperty.all(
                      const ContinuousRectangleBorder()),
                  elevation: MaterialStateProperty.resolveWith((states) => 0.0),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0xff7DD8C6);
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xff008E73);
                      }
                      return const Color(0xff00C19C);
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            // state.password.value.fold(
            //   (f) => f.maybeMap(
            //     invalidEmail: (_) => const Text(
            //       '! 존재하지 않는 아이디입니다.',
            //       style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.w700,
            //         color: Color(0xff00C19C),
            //       ),
            //     ),
            //     shortPassword: (_) => const Text(
            //       '! 비밀번호를 6자 이상 입력해 주세요.',
            //       style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.w700,
            //         color: Color(0xff00C19C),
            //       ),
            //     ),
            //     orElse: () => const Offstage(),
            //   ),
            //   (_) => const Offstage(),
            // ),
            state.authFailureOrSuccessOption.fold(
                    () => const Offstage(),
                    (failureOrSuccess) => failureOrSuccess.fold(
                            (f) => f.maybeMap(
                              invalidEmailAndPasswordCombination: (_) =>
                              const Text(
                                '! 아이디 또는 비밀번호가 일치하지 않습니다.',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff00C19C),
                                  ),
                                ),
                              orElse: () => const Offstage(),),
                            (token) => const Offstage()
                    )
            ),
          ],
        );
      },
    );
  }

  Widget _signUpButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 66.0),
      width: double.infinity,
      height: 38,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            colors: <Color>[
              Color(0xff00C19C),
              Color(0xff7077D5),
            ],
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(2),
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context){
              return const SignUp();
            }));
          }
          ,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.black;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  );
                }
                return const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                );
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.transparent;
                }
                return Colors.white;
              },
            ),
          ),
          child: const Text(
            "회원가입",
          ),
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
