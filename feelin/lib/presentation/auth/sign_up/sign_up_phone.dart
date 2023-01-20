import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';

import '../../common/next_button.dart';
import '../../style/colors.dart';
import 'common_title.dart';

class SignUpPhone extends StatefulWidget{
  final Map input;
  final Function goToNext;
  final Function toggleMethod;
  const SignUpPhone({Key? key, required this.input, required this.goToNext, required this.toggleMethod}) : super(key: key);

  @override
  State<SignUpPhone> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpPhone> with TickerProviderStateMixin{

  bool isPhoneValid = false;

  final TextEditingController _phoneTextController = TextEditingController();
  String initialCountry = WidgetsBinding.instance.window.locale.countryCode ?? 'US';
  late PhoneNumber initialNumber = PhoneNumber(isoCode: initialCountry);
  late PhoneNumber number = PhoneNumber(isoCode: initialCountry);

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
                  const CommonTitle(title: 'What\’s your \nphone number?'),
                  _phoneField(),
                ],
              ),
            ),
            insteadButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NextButton(disabled: !isPhoneValid,
                function: (){
                  // context
                  //     .read<SignUpFormBloc>()
                  //     .add(const SignUpFormEvent.requested());
                  // 요청 성공 시 goToNext();
                  print('${number.dialCode}${number.parseNumber()}');
                  widget.goToNext();
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
    return InternationalPhoneNumberInput(
      selectorConfig: selectorConfig,
      ignoreBlank: true,
      keyboardAction: TextInputAction.next,
      onFieldSubmitted: (_){
        if(isPhoneValid){
          // context
          //     .read<SignUpFormBloc>()
          //     .add(const SignUpFormEvent.requested());
          widget.goToNext();
        }
      },
      onInputChanged: (PhoneNumber value) { setState(() {
        widget.input['phoneNumber'] = value.phoneNumber;
        number = value;
      });},
      onInputValidated: (bool value) {
        isPhoneValid = value;
      },
      errorMessage: 'please enter a valid phone number.',
      autoValidateMode: AutovalidateMode.always,
      initialValue: initialNumber,
      textFieldController: _phoneTextController,
      formatInput: false,
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        hintText: 'Phone number',
        isDense: true,
      ),
      selectorTextStyle: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget insteadButton(){
    return TextButton(onPressed: (){
      context.read<SignUpFormBloc>().add(const SignUpFormEvent.setEmail());
      widget.toggleMethod();
    },
        child: Text('Use email instead',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: FeelinColorFamily.redPrimary,),
        ),
    );
  }

}