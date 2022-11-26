import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../style/colors.dart';
import 'common_description.dart';
import 'common_title.dart';
import 'next_button.dart';

class SignUpPassword extends StatefulWidget{
  final Map<String, String> input;
  final Function goToNext;
  const SignUpPassword({Key? key, required this.input, required this.goToNext}) : super(key: key);

  @override
  State<SignUpPassword> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpPassword>{

  final TextEditingController _passwordTextController = TextEditingController();
  String password = '';

  @override
  void dispose(){
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const CommonTitle(title: 'Choose your password'),
        const SizedBox(height: 10,),
        const CommonDescription(description: 'Your password should be 8 letters or longer',),
        const SizedBox(height: 30,),
        _nameField(),
        const SizedBox(height: 30,),
        NextButton(disabled: password.length < 6,
          function: (){
            setState(() {
              widget.input['password'] = password;
            });
            widget.goToNext();
          },)
      ],
    );
  }


  Widget _nameField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _passwordTextController,
              obscureText: true,
              obscuringCharacter: '●',
              decoration: InputDecoration(
                hintText: 'Password',
                isDense: true,
                border: OutlineInputBorder(
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
                suffixIcon: (password.isNotEmpty) ? IconButton(onPressed: (){_passwordTextController.clear(); setState(() {
                  password = '';
                });}, icon: Icon(Icons.cancel, color: Colors.grey,)): const SizedBox.shrink()
              ),
              validator: (_) =>
                  context.read<SignUpFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                      empty: (_) => '비밀번호를 입력해주세요',
                      orElse: () => null,
                    ),
                        (_) => null,
                  ),
              onChanged: (value) {
                setState((){
                  password = value;
                });
              },
            ),
          );
        });
  }
}