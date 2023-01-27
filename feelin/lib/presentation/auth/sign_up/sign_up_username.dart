import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_password.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';
import 'common_title.dart';

class SignUpUsername extends StatefulWidget{
  final Function goToNext;
  const SignUpUsername({Key? key, required this.goToNext,}) : super(key: key);

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
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: BoxConstraints(maxHeight: 475),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              constraints: BoxConstraints(maxHeight: 210),
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
              padding: const EdgeInsets.only(bottom: 20),
              child: BlocBuilder<SignUpFormBloc, SignUpFormState>(
                  builder: (context, state) {
                    return NextButton(disabled: !state.canUseName,
                      function: (){
                        widget.goToNext();
                      },);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _usernameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _nameTextController,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.41,
              ),
              maxLength: 20,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                widget.goToNext();
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9 . _]')),
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                hintText: 'Username',
                isDense: true,
                suffixIcon: (state.canUseName) ? const Icon(Icons.check_circle_outline, color: Colors.green,) : const SizedBox.shrink(),
              ),
              validator: (_) => null,
              onChanged: (value) {
                context.read<SignUpFormBloc>().add(SignUpFormEvent.usernameChanged(value));
                context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
                setState((){
                  name = value;
                });
              },
            ),
          );
        });
  }
}