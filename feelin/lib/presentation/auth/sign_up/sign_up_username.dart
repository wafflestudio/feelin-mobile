import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';
import 'common_title.dart';
import 'sign_up_app_bar.dart';
import 'sign_up_password.dart';

class SignUpUsername extends StatefulWidget{
  const SignUpUsername({Key? key,}) : super(key: key);

  @override
  State<SignUpUsername> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpUsername>{

  final TextEditingController _nameTextController = TextEditingController();
  String name = '';

  @override
  void dispose(){
    _nameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(reset: true,),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 475),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                constraints: const BoxConstraints(maxHeight: 210),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonTitle(title: 'Choose your username'),
                    _usernameField(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: BlocBuilder<SignUpFormBloc, SignUpFormState>(
                    builder: (context, state) {
                      return NextButton(disabled: !state.canUseName,
                        function: (){
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context2){
                              return BlocProvider.value(
                                  value: context.read<SignUpFormBloc>(),
                                  child: const SignUpPassword());
                            },
                          ),
                          );
                        },);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _usernameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _nameTextController,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.41,
              ),
              maxLength: 20,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context2){
                    return BlocProvider.value(
                        value: context.read<SignUpFormBloc>(),
                        child: const SignUpPassword());
                  },
                ),
                );
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-z 0-9 . _]')),
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                hintText: 'Username',
                isDense: true,
                counterText: '',
                contentPadding: const EdgeInsets.fromLTRB(10, 10, -38, 10),
                suffixIcon: (state.loadingUsername && state.username.isValid()) ? Transform.scale(scale: 0.25, child: CircularProgressIndicator(strokeWidth: 5, color: FeelinColorFamily.gray300,)):(state.canUseName) ? const Icon(Icons.check_circle_outline, color: Colors.green,) : (!state.canUseName && _nameTextController.text.isNotEmpty) ? const Icon(Icons.cancel_outlined, color: Colors.red,): const SizedBox.shrink(),
              ),
              validator: (_) => null,
              onChanged: (value) {
                context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
                context.read<SignUpFormBloc>().add(const SignUpFormEvent.loadingUsername());
                context.read<SignUpFormBloc>().add(SignUpFormEvent.usernameChanged(value));
                setState((){
                  name = value;
                });
              },
            ),
          );
        });
  }
}