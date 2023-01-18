import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/common_description.dart';
import 'package:music_sns/presentation/auth/sign_up/common_title.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';

class SignUpName extends StatefulWidget{
  final Map<String, String> input;
  final Function goToNext;
  const SignUpName({Key? key, required this.input, required this.goToNext}) : super(key: key);

  @override
  State<SignUpName> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpName>{

  final TextEditingController _nameTextController = TextEditingController();
  String name = '';

  @override
  void dispose(){
    _nameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const CommonTitle(title: 'What\'s your name?'),
        const SizedBox(height: 30,),
        _nameField(),
        const SizedBox(height: 30,),
        NextButton(disabled: name.isEmpty,
          function: (){
          setState(() {
            widget.input['name'] = name;
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
              controller: _nameTextController,
              textAlign: TextAlign.center,
              onFieldSubmitted: (_){

              },
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.41,
              ),
              decoration: InputDecoration(
                hintText: 'Name',
                isDense: true,
                ),
              validator: (_) =>
                  null,
              onChanged: (value) {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.nameChanged(value));
                setState((){
                  name = value;
                });
                },
            ),
          );
        });
  }
}