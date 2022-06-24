import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/domain/auth/token.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/explore/playlist_info_page.dart';

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
  final storage = const FlutterSecureStorage();


  @override
  void dispose(){
    _passwordConfirmTextController.dispose();
    _passwordTextController.dispose();
    _lastNameTextController.dispose();
    _firstNameTextController.dispose();
    _userNameTextController.dispose();
    _phoneNumberTextController.dispose();
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
            create: (context) => getIt<SignUpFormBloc>(),
            child: _signUpForm(screenSize),
          ),
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
                          storage.write(key: "token", value: (_ as Token).token),
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return PlaylistInfoPage();
                          })),
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
            decoration: const InputDecoration(
              hintText: '사용자 이름',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            validator: (_) =>
                context.read<SignUpFormBloc>().state.userName.value.fold(
                      (f) => f.maybeMap(
                    invalidUserName: (_) => '사용자 이름을 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) => context
                .read<SignUpFormBloc>()
                .add(SignUpFormEvent.userNameChanged(value)),
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
                .add(SignUpFormEvent.userNameChanged(value)),
          );
        });
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}