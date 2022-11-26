import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/profile/profile_page.dart';

class SignUpPage extends StatefulWidget{
  final EmailAddress emailAddress;
  const SignUpPage({Key? key, required this.emailAddress}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordConfirmTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _firstNameTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController = TextEditingController();
  final TextEditingController _birthdayTextController = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  void initState(){
    super.initState();
    context.read<SignUpFormBloc>().add(SignUpFormEvent.emailAddressChanged(widget.emailAddress.getOrCrash()));
  }

  @override
  void dispose(){
    _passwordConfirmTextController.dispose();
    _passwordTextController.dispose();
    _lastNameTextController.dispose();
    _firstNameTextController.dispose();
    _userNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _birthdayTextController.dispose();
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
          child: _signUpForm(screenSize),
        ),
      ),
    );
  }

  Widget _signUpForm(Size size){
    return BlocListener<SignUpFormBloc, SignUpFormState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                        (f) => _showSnackBar(context, f.toString()),
                        (_) => {
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context){
                            return const ProfilePage();
                          }),(route) => false),
                        }
            ),
          );
        },
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 4,
                ),
                child: _emailField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _passwordField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _passwordConfirmField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _firstNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _lastNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _userNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _phoneNumberField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _birthdayField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 4,
                  ),
                  child: _signUpButton(size),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            readOnly: true,
            initialValue: widget.emailAddress.getOrCrash(),
            decoration: const InputDecoration(
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.emailAddressChanged(value)),
          );
        });
  }

  Widget _passwordField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _passwordTextController,
            decoration: const InputDecoration(
              hintText: '비밀번호',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.password.value.fold(
                      (f) => f.maybeMap(
                    shortPassword: (_) => '6자 이상의 비밀번호를 입력해주세요.',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.passwordChanged(value)),
          );
        });
  }

  Widget _passwordConfirmField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _passwordConfirmTextController,
            decoration: const InputDecoration(
              hintText: '비밀번호 확인',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.password.value.fold(
                      (f) => f.maybeMap(
                    wrongPasswordConfirm: (_) => '비밀번호를 다시 확인해주세요.',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.passwordConfirmChanged(value)),
          );
        });
  }
  Widget _lastNameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _lastNameTextController,
            decoration: const InputDecoration(
              hintText: '성',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.lastName.value.fold(
                      (f) => f.maybeMap(
                    empty: (_) => '성을 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.lastNameChanged(value)),
          );
        });
  }

  Widget _firstNameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _firstNameTextController,
            decoration: const InputDecoration(
              hintText: '이름',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.firstName.value.fold(
                      (f) => f.maybeMap(
                    empty: (_) => '이름을 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.firstNameChanged(value)),
          );
        });
  }

  Widget _userNameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _userNameTextController,
            decoration: InputDecoration(
              hintText: '사용자 이름',
              isDense: true,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
              suffixIcon: (state.canUseName) ? const Icon(Icons.check_circle, color: Colors.green,) : const SizedBox.shrink(),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.username.value.fold(
                      (f) => f.maybeMap(
                    invalidUserName: (_) => '사용자 이름을 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) {
              context.read<SignUpFormBloc>().add(SignUpFormEvent.usernameChanged(value));
              context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
            }
            ,
          );
        });
  }

  Widget _phoneNumberField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _phoneNumberTextController,
            decoration: const InputDecoration(
              hintText: '전화번호',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.phoneNumber.value.fold(
                      (f) => f.maybeMap(
                    invalidPhoneNum: (_) => '전화 번호를 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.phoneNumberChanged(value)),
          );
        });
  }

  Widget _birthdayField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _birthdayTextController,
            decoration: const InputDecoration(
              hintText: '생일',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.birthday.value.fold(
                      (f) => f.maybeMap(
                    invalidPhoneNum: (_) => '생일 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.birthdayChanged(value)),
          );
        });
  }

  Widget _signUpButton(Size size) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: (!state.isSubmitting && state.emailAddress.isValid()
                    && state.password.isValid() && state.passwordConfirm.isValid() &&
                    state.password.getOrCrash() == state.passwordConfirm.getOrCrash()
                    && state.firstName.isValid() && state.lastName.isValid() &&
                    state.username.isValid() && state.phoneNumber.isValid() &&
                    state.birthday.isValid() && state.canUseName)
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<SignUpFormBloc>()
                        .add(const SignUpFormEvent.submitted());
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
                  '가입하기',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            state.authFailureOrSuccessOption.fold(
                    () => const Offstage(),
                    (failureOrSuccess) => failureOrSuccess.fold(
                        (f) => f.maybeMap(
                      usernameAlreadyInUse: (_) =>
                      const Text(
                        '! 입력하신 사용자 이름 혹은 전화번호가 이미 사용 중입니다.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00C19C),
                        ),
                      ),
                          invalidBirthdayForm: (_) =>
                          const Text(
                            '! 입력하신 생일의 양식이 잘못되었습니다. 다시 입력해주세요.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00C19C),
                            ),
                          ),
                          unauthorizedEmail: (_) =>
                          const Text(
                            '! 인증되지 않은 이메일입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00C19C),
                            ),
                          ),
                          tokenNotFound: (_) =>
                          const Text(
                            '! 인증 토큰을 찾을 수 없습니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00C19C),
                            ),
                          ),
                      orElse: () => const Offstage(),),
                        (_) => const Offstage()
                )
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