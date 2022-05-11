import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/email_auth_form/email_auth_form_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/domain/auth/value_objects.dart';
import 'package:music_sns/injection.dart';

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
            child: _verifyEmailForm(screenSize),
          ),
        ),
      ),
    );
  }

  Widget _verifyEmailForm(Size size){
    return BlocListener<EmailAuthFormBloc, EmailAuthFormState>(
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