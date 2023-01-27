import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/common_title.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_birthday.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';

class SignUpName extends StatefulWidget{
  final Function goToNext;
  const SignUpName({Key? key, required this.goToNext,}) : super(key: key);

  @override
  State<SignUpName> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpName> with AutomaticKeepAliveClientMixin{

  final TextEditingController _nameTextController = TextEditingController();
  String name = '';

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose(){
    _nameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Align(
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
                  const CommonTitle(title: 'What\'s your name?'),
                  _nameField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NextButton(disabled: name.isEmpty,
                function: (){
                  widget.goToNext();
                },),
            ),
          ],
        ),
      ),
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
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                if(name.isNotEmpty){
                  widget.goToNext();
                }
              },
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.41,
              ),
              decoration: const InputDecoration(
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