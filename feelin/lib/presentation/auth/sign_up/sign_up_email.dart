import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';
import 'common_title.dart';

class SignUpEmail extends StatefulWidget{
  final Map input;
  final Function goToNext;
  final Function toggleMethod;
  const SignUpEmail({Key? key, required this.input, required this.goToNext, required this.toggleMethod}) : super(key: key);

  @override
  State<SignUpEmail> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpEmail> with TickerProviderStateMixin{

  final TextEditingController _emailTextController = TextEditingController();
  bool isEmailValid = false;


  @override
  void initState() {
    super.initState();
    _emailTextController.addListener(() {
      isEmailValid = EmailValidator.validate(_emailTextController.value.text);
    });
  }

  @override
  void dispose() {
    _emailTextController.dispose();
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
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              constraints: BoxConstraints(maxHeight: 210),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CommonTitle(title: 'What\’s your \nemail address?'),
                  _emailField(),
                ],
              ),
            ),
            insteadButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NextButton(disabled: !isEmailValid,
                function: (){
                  context
                      .read<SignUpFormBloc>()
                      .add(const SignUpFormEvent.requested());
                  // 요청 성공 시 goToNext();
                  widget.goToNext();
                },),
            )
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _emailTextController,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_){
              if(isEmailValid){
                context
                    .read<SignUpFormBloc>()
                    .add(const SignUpFormEvent.requested());
                widget.goToNext();
              }
            },
            decoration: InputDecoration(
              hintText: 'Email address',
              isDense: true,
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: (value){
              if(value != null && value != '' && !EmailValidator.validate(value ?? '')){
                return 'please enter a valid email.';
              }else{
                return null;
              }

            },
            onChanged: (value) => setState(() {
              widget.input['email'] = value;
              context
                  .read<SignUpFormBloc>()
                  .add(SignUpFormEvent.emailAddressChanged(value));
            }),
          );
        }
    );
  }

  Widget insteadButton(){
    return TextButton(onPressed: (){
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.setPhone());
      widget.toggleMethod();
    },
      child: Text('Use phone number instead',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: FeelinColorFamily.redPrimary,),
      ),
    );
  }
}