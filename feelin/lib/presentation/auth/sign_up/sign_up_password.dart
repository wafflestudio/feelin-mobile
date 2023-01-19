import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../style/colors.dart';
import 'common_description.dart';
import 'common_title.dart';
import '../../common/next_button.dart';

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
    return BlocListener<SignUpFormBloc, SignUpFormState>(
      listener: (context, state){
        state.authFailureOrSuccessOption.fold(
                () => null,
                (failOrSuccess) => failOrSuccess.fold((f) => null, (_) => widget.goToNext()));
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 505),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                constraints: const BoxConstraints(maxHeight: 210),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CommonTitle(title: 'Choose your password'),
                        SizedBox(height: 10,),
                        CommonDescription(description: 'It should be 8 letters or longer',),
                      ],
                    ),
                    _passwordField(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: NextButton(disabled: password.length < 8,
                  function: (){
                    setState(() {
                      widget.input['password'] = password;
                    });
                    print(context
                        .read<SignUpFormBloc>().state.password.getOrCrash());
                    print(context
                        .read<SignUpFormBloc>().state.username.getOrCrash());
                    print(context
                        .read<SignUpFormBloc>().state.birthday.getOrCrash());
                    print(context
                        .read<SignUpFormBloc>().state.name.getOrCrash());
                    print(context
                        .read<SignUpFormBloc>().state.emailAddress.getOrCrash());
                    print(context
                        .read<SignUpFormBloc>().state.canUseName);
                    context
                        .read<SignUpFormBloc>()
                        .add(const SignUpFormEvent.submitted());
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _passwordField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _passwordTextController,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.41),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_){
                if(password.length >= 8){
                  setState(() {
                    widget.input['password'] = password;
                  });
                  context
                      .read<SignUpFormBloc>()
                      .add(const SignUpFormEvent.submitted());
                }
              },
              decoration: InputDecoration(
                hintText: 'Password',
                isDense: true,
                suffixIcon: (password.isNotEmpty) ? IconButton(onPressed: (){_passwordTextController.clear(); setState(() {
                  password = '';
                });}, icon: const Icon(Icons.cancel, color: Colors.grey,)): const SizedBox.shrink()
              ),
              validator: (_) =>
                  context.read<SignUpFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                      empty: (_) => 'Please enter password.',
                      orElse: () => null,
                    ),
                        (_) => null,
                  ),
              onChanged: (value) {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.passwordChanged(value));
                setState((){
                  password = value;
                });
              },
            ),
          );
        });
  }
}