import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../style/colors.dart';
import 'common_description.dart';
import 'common_title.dart';
import '../../common/next_button.dart';

class SignUpUsername extends StatefulWidget{
  final Map<String, String> input;
  final Function goToNext;
  const SignUpUsername({Key? key, required this.input, required this.goToNext}) : super(key: key);

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const CommonTitle(title: 'Choose your username'),
        const SizedBox(height: 30,),
        _usernameField(),
        const SizedBox(height: 10,),
        const CommonDescription(description: 'You can always change your username later',),
        const SizedBox(height: 30,),
        BlocBuilder<SignUpFormBloc, SignUpFormState>(
          builder: (context, state) {
            return NextButton(disabled: !state.canUseName,
              function: (){
                setState(() {
                  widget.input['username'] = name;
                });
                widget.goToNext();
              },);
          }
        )
      ],
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
              decoration: InputDecoration(
                hintText: 'Username',
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: FeelinColorFamily.red500, width: 0.5),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.red, width: 0.5),
                ),
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