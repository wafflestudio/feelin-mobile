import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';
import 'package:music_sns/presentation/auth/sign_in/sign_in_password.dart';
import '../../../application/auth/auth/auth_bloc.dart';
import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../../injection.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';
import '../sign_up/common_title.dart';
import '../sign_up/sign_up.dart';

class SignInEmail extends StatefulWidget{
  final Function toggleMethod;
  const SignInEmail({Key? key, required this.toggleMethod}) : super(key: key);

  @override
  State<SignInEmail> createState() => _SignInEmailState();

}
class _SignInEmailState extends State<SignInEmail> with TickerProviderStateMixin{

  final TextEditingController _emailTextController = TextEditingController();
  bool isEmailValid = false;
  bool navigated = true;


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
        constraints: const BoxConstraints(maxHeight: 475),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10,),
              constraints: const BoxConstraints(maxHeight: 210, minHeight: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CommonTitle(title: 'What’s your \nemail address?'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _emailField(),
            ),
            insteadButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NextButton(disabled: !isEmailValid,
                isLoading: context.watch<SignInFormBloc>().state.isRequesting,
                function: (){
                navigated = false;
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.emailRequested());
                },),
            )
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocListener<SignInFormBloc, SignInFormState>(
      listener: (context2, state){
        state.requestFailureOrSuccessOption.fold(
                () => null,
        (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (existsUser){
                  if(navigated) return;
                  navigated = true;
                  if(existsUser.existsUser){
                    Navigator.push(context2, CupertinoPageRoute(builder: (context2){
                      return MultiBlocProvider(providers: [
                        BlocProvider.value(value: context.read<SignInFormBloc>()),
                        BlocProvider.value(value: context2.read<AuthBloc>()),
                      ], child: const SignInPassword());
                    }));
                  }else{
                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                      return MultiBlocProvider(providers: [
                        BlocProvider(create: (context) => getIt<SignUpFormBloc>()),
                        BlocProvider.value(value: context.read<AuthBloc>())
                      ], child: SignUp(withEmail: true, email: state.emailAddress.getOrCrash(),));
                    }));
                  }
                }
        ),
        );
      },
      child: BlocBuilder<SignInFormBloc, SignInFormState>(
          builder: (context, state) {
            return TextFormField(
              controller: _emailTextController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (_){
                if(isEmailValid){
                  navigated = false;
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.emailRequested());
                }
              },
              enabled: !state.isRequesting,
              decoration: const InputDecoration(
                hintText: 'Email address',
                isDense: true,
              ),
              autovalidateMode: AutovalidateMode.always,
              validator: (value){
                if(value != null && value != '' && !EmailValidator.validate(value)){
                  return 'please enter a valid email.';
                }else{
                  return null;
                }

              },
              onChanged: (value) => setState(() {
                context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailAddressChanged(value));
              }),
            );
          }
      ),
    );
  }

  Widget insteadButton(){
    return TextButton(onPressed: (){
      context.read<SignInFormBloc>().add(const SignInFormEvent.setPhone());
      widget.toggleMethod();
    },
      child: Text('Use phone number instead',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: FeelinColorFamily.redPrimary,),
      ),
    );
  }
}