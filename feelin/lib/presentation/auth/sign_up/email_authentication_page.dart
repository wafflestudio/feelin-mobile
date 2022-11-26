import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/email_auth_form/email_auth_form_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_page.dart';

class EmailAuthenticationPage extends StatefulWidget{
  const EmailAuthenticationPage({Key? key}) : super(key: key);

  @override
  State<EmailAuthenticationPage> createState() => _EmailAuthenticationPageState();
}

class _EmailAuthenticationPageState extends State<EmailAuthenticationPage>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _codeTextController = TextEditingController();

  @override
  void dispose(){
    _emailTextController.dispose();
    _codeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => getIt<EmailAuthFormBloc>(),
            child: _emailAuthForm(screenSize),
          ),
        ),
      ),
    );
  }

  Widget _emailAuthForm(Size size) {
    return BlocListener<EmailAuthFormBloc, EmailAuthFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => _showSnackBar(context, f.toString()), // 인증 실패
                  (_) => {
                Navigator.push(context, CupertinoPageRoute(
                    builder: (context){
                  return BlocProvider(
                      create: (context) => getIt<SignUpFormBloc>(),
                      child: SignUpPage(emailAddress: state.emailAddress,));
                })), // 인증 성공
              }

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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 6,
                ),
                child: _emailField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 6,
                ),
                child: _codeField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 20,
                ),
                child: _verifyEmailButton(size),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 66.0,
                  vertical: 20,
                ),
                child: _requestEmailVerificationButton(size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<EmailAuthFormBloc, EmailAuthFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _emailTextController,
            decoration: const InputDecoration(
              hintText: '이메일',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<EmailAuthFormBloc>().state.emailAddress.value.fold(
                      (f) => f.maybeMap(
                    invalidEmail: (_) => null, //'올바른 형식의 이메일을 입력해 주세요.',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<EmailAuthFormBloc>()
                .add(EmailAuthFormEvent.emailChanged(value)),
          );
        });
  }

  Widget _codeField() {
    return BlocBuilder<EmailAuthFormBloc, EmailAuthFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _codeTextController,
            decoration: const InputDecoration(
              hintText: '인증 코드',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<EmailAuthFormBloc>().state.code.value.fold(
                      (f) => f.maybeMap(
                    invalidEmailAuthCode: (_) => null, //'올바른 형식의 이메일을 입력해 주세요.',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<EmailAuthFormBloc>()
                .add(EmailAuthFormEvent.codeChanged(value)),
          );
        });
  }

  Widget _verifyEmailButton(Size size) {
    return BlocBuilder<EmailAuthFormBloc, EmailAuthFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: (_emailTextController.text.isNotEmpty &&
                    _codeTextController.text.isNotEmpty && state.isRequested)
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<EmailAuthFormBloc>()
                        .add(const EmailAuthFormEvent.submitted());
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
                  '인증하기',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            state.code.value.fold(
                  (f) => f.maybeMap(
                invalidEmailAuthCode: (_) => const Text(
                  '! 잘못된 인증 코드입니다..',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C19C),
                  ),
                ),
                invalidEmail: (_) => const Text(
                  '! 올바른 이메일을 입력해주세요.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C19C),
                  ),
                ),
                orElse: () => const Offstage(),
              ),
                  (_) => const Offstage(),
            ),
          ],
        );
      },
    );
  }

  Widget _requestEmailVerificationButton(Size size) {
    return BlocBuilder<EmailAuthFormBloc, EmailAuthFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: (_emailTextController.text.isNotEmpty && !state.isRequested)
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<EmailAuthFormBloc>()
                        .add(const EmailAuthFormEvent.requested());
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
                  '인증 요청',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                invalidEmail: (_) => const Text(
                  '! 올바른 이메일을 입력해주세요.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C19C),
                  ),
                ),
                orElse: () => const Offstage(),
              ),
                  (_) => const Offstage(),
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