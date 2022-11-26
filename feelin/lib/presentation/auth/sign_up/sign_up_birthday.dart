import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../style/colors.dart';
import 'common_description.dart';
import 'common_title.dart';
import 'next_button.dart';

class SignUpBirthday extends StatefulWidget{
  final Map<String, String> input;
  final Function goToNext;
  const SignUpBirthday({Key? key, required this.input, required this.goToNext}) : super(key: key);

  @override
  State<SignUpBirthday> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpBirthday>{

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

        const CommonTitle(title: 'Add your birthday'),
        const SizedBox(height: 10,),
        const CommonDescription(description: 'This information won\'t be part of your public profile',),
        const SizedBox(height: 30,),
        _nameField(),
        const SizedBox(height: 30,),
        NextButton(disabled: name.isEmpty,
          function: (){
            setState(() {
              widget.input['birth'] = name;
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
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'Birthday',
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
                  context.read<SignUpFormBloc>().state.lastName.value.fold(
                        (f) => f.maybeMap(
                      empty: (_) => '이름을 입력해주세요',
                      orElse: () => null,
                    ),
                        (_) => null,
                  ),
              onChanged: (value) {
                setState((){
                  name = value;
                });
              },
            ),
          );
        });
  }
}