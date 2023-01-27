import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart';

import '../../../application/auth/auth/auth_bloc.dart';
import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../../injection.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';
import '../sign_up/common_title.dart';
import '../sign_up/sign_up.dart';
import 'sign_in_password.dart';

class SignInPhone extends StatefulWidget{
  final Function toggleMethod;
  const SignInPhone({Key? key, required this.toggleMethod}) : super(key: key);

  @override
  State<SignInPhone> createState() => _SignInPhoneState();

}
class _SignInPhoneState extends State<SignInPhone> with TickerProviderStateMixin{

  bool isPhoneValid = false;
  bool navigated = true;

  final TextEditingController _phoneTextController = TextEditingController();
  String initialCountry = WidgetsBinding.instance.window.locale.countryCode ?? 'US';
  late PhoneNumber initialNumber = PhoneNumber(isoCode: initialCountry);
  late PhoneNumber number = PhoneNumber(isoCode: initialCountry);

  @override
  void initState() {
    super.initState();
    initialNumber = PhoneNumber(isoCode: initialCountry);
    context.read<SignInFormBloc>().add(SignInFormEvent.countryCodeChanged(initialNumber.isoCode ?? '+1'));
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
                children: [
                  const CommonTitle(title: 'What\’s your \nphone number?'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _phoneField(),
            ),
            insteadButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NextButton(disabled: !isPhoneValid,
                isLoading: context.watch<SignInFormBloc>().state.isRequesting,
                function: (){
                navigated = false;
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.phoneRequested());
                },),
            )
          ],
        ),
      ),
    );
  }

  SelectorConfig selectorConfig = const SelectorConfig(
    setSelectorButtonAsPrefixIcon: true,
    useEmoji: true,
    showFlags: true,
    leadingPadding: 5,
    trailingSpace: false,
    selectorType: PhoneInputSelectorType.DIALOG,
  );

  Widget _phoneField() {
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
                        ], child: SignUp(withEmail: false, phoneNumber: state.phoneNumber.getOrCrash(), countryCode: state.countryCode.getOrCrash(),));
                      }));
                    }
              }
          ),
        );
      },
      child: InternationalPhoneNumberInput(
        selectorConfig: selectorConfig,
        ignoreBlank: true,
        keyboardAction: TextInputAction.next,
        isEnabled: !context.watch<SignInFormBloc>().state.isRequesting,
        onFieldSubmitted: (_){
          if(isPhoneValid){
            navigated = false;
            context
                .read<SignInFormBloc>()
                .add(const SignInFormEvent.phoneRequested());
          }
        },
        onInputChanged: (PhoneNumber value) {
          setState(() {
            number = value;
          });
          print(value.parseNumber());
          print(value.dialCode ?? '');
          context.read<SignInFormBloc>().add(SignInFormEvent.phoneNumberChanged(value.parseNumber() ?? ''));
          context.read<SignInFormBloc>().add(SignInFormEvent.countryCodeChanged(value.dialCode ?? ''));
        },
        onInputValidated: (bool value) {
          isPhoneValid = value;
        },
        errorMessage: 'please enter a valid phone number.',
        autoValidateMode: AutovalidateMode.always,
        initialValue: initialNumber,
        textFieldController: _phoneTextController,
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputDecoration: const InputDecoration(
          hintText: 'Phone number',
          isDense: true,
        ),
        selectorTextStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget insteadButton(){
    return TextButton(onPressed: (){
      context.read<SignInFormBloc>().add(const SignInFormEvent.setEmail());
      widget.toggleMethod();
    },
        child: Text('Use email instead',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: FeelinColorFamily.redPrimary,),
        ),
    );
  }

}