import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/auth/auth/auth_bloc.dart';
import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../../application/streaming/connect/connect_streaming_bloc.dart';
import '../../../injection.dart';
import '../../common/next_button.dart';
import '../../streaming/connect_streaming_page.dart';
import '../../style/colors.dart';
import 'common_description.dart';
import 'common_title.dart';
import 'sign_up_app_bar.dart';

class SignUpPassword extends StatefulWidget{
  const SignUpPassword({Key? key,}) : super(key: key);

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
                (failOrSuccess) => failOrSuccess.fold((f) => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                        backgroundColor: FeelinColorFamily.errorPrimary,
                        icon: const Icon(Icons.music_note, color: Colors.transparent,),
                        message: f.toString())
                ), (_) {
                    context.read<AuthBloc>()
                        .add(const AuthEvent.submitted());
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                      builder: (context){
                        return BlocProvider(
                            create: (context) => getIt<ConnectStreamingBloc>(),
                            child: const ConnectStreamingPage());
                      },
                    ),
                        (route) => route.isFirst
                );
                },
                ));
      },
      child: Scaffold(
        appBar: const SignUpAppBar(),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 475),
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
                  padding: const EdgeInsets.only(bottom: 8),
                  child: NextButton(disabled: password.length < 8,
                    function: (){
                      context
                          .read<SignUpFormBloc>()
                          .add(const SignUpFormEvent.submitted());
                    },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _passwordField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _passwordTextController,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -0.41),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_){
                if(password.length >= 8){
                  // context
                  //     .read<SignUpFormBloc>()
                  //     .add(const SignUpFormEvent.submitted());
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