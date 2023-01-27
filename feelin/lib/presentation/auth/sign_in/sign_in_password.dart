import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/common_description.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/auth/auth/auth_bloc.dart';
import '../../../application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import '../../common/next_button.dart';
import '../sign_up/common_title.dart';

class SignInPassword extends StatefulWidget{
  const SignInPassword({Key? key,}) : super(key: key);

  @override
  State<SignInPassword> createState() => _SignInPasswordState();

}
class _SignInPasswordState extends State<SignInPassword> with TickerProviderStateMixin{

  final TextEditingController _passwordTextController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
      ),
      body: Align(
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
                    Column(
                      children: [
                        const CommonTitle(title: 'You already \nhave an account'),
                        CommonDescription(description: 'Enter your password to login')
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _passwordField(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: NextButton(disabled: _passwordTextController.text.isEmpty,
                  isLoading: context.watch<SignInFormBloc>().state.isSubmitting,
                  function: (){
                    context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.submitted());
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return BlocListener<SignInFormBloc, SignInFormState>(
      listener: (context, state){
        state.authFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => print(f),
                  (_){
                    context.read<AuthBloc>()
                        .add(const AuthEvent.submitted());
                    Navigator.popUntil(context, (route) => route.isFirst);
              }
          ),
        );
      },
      child: BlocBuilder<SignInFormBloc, SignInFormState>(
          builder: (context, state) {
            return TextFormField(
              controller: _passwordTextController,
              onFieldSubmitted: (_){
                if(_passwordTextController.text.isNotEmpty){
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.submitted());
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              enabled: !context.watch<SignInFormBloc>().state.isSubmitting,
              obscureText: !_passwordVisible,
              obscuringCharacter: '*',
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                isDense: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: FeelinColorFamily.gray600,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              validator: (_) => state.authFailureOrSuccessOption.fold(
                      () => null,
                      (failureOrSuccess) => failureOrSuccess.fold(
                          (f) => f.maybeMap(
                        invalidAccountAndPasswordCombination: (_) => 'The account or password do not match',
                        orElse: () => 'server error',),
                          (token) => null
                  )
              ),
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(value)),
            );
          }),
    );
  }
}