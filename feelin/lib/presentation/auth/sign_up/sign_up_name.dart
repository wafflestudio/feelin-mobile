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

        const CommonTitle(title: 'Add Your Name'),
        const SizedBox(height: 10,),
        const CommonDescription(description: 'Enter the name you use in real life', isGrey: true,),
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
              decoration: InputDecoration(
                hintText: 'Name',
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