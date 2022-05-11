
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/injection.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _firstNameTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController = TextEditingController();


  @override
  void dispose(){
    _emailTextController.dispose();
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
        },
        child: Form(
          key: _formKey,
          child: SizedBox(
          ),
        ),
    );
  }


}