import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';

import '../../style/colors.dart';
import 'common_description.dart';

class ConfirmationTabBar extends StatefulWidget{
  final Map input;
  final Function functionP;
  final Function functionE;
  final TabController tabController;

  const ConfirmationTabBar({Key? key, required this.input, required this.functionP, required this.functionE, required this.tabController}) : super(key: key);

  @override
  State<ConfirmationTabBar> createState() => _NextButtonState();

}
class _NextButtonState extends State<ConfirmationTabBar>{
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  String initialCountry = 'KR';
  PhoneNumber number = PhoneNumber(isoCode: 'KR');

  @override
  void initState() {
    super.initState();
    _emailTextController.addListener(() {
      bool isEmailValid = EmailValidator.validate(_emailTextController.value.text);
      widget.functionE(isEmailValid);
    });
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TabBar(
            controller: widget.tabController,
            isScrollable: false,
            physics: const BouncingScrollPhysics(),
            // labelColor: GuamColorFamily.grayscaleGray1,
            // unselectedLabelColor: GuamColorFamily.grayscaleGray4,
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            tabs: const [
              Tab(
                child: Text('Phone', style: TextStyle(fontSize: 18),),
              ),
              Tab(
                child: Text('Email', style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height: 120,
            child: TabBarView(
                controller: widget.tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      _phoneField(),
                      const SizedBox(height: 5,),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CommonDescription(description: 'You may receive SMS notifications from us for security and login purpose.'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _emailField(),
                      const SizedBox(height: 5,),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CommonDescription(description: 'You may receive SMS notifications from us for security and login purpose.'),
                      ),
                    ],
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: _emailTextController,
          decoration: InputDecoration(
            hintText: 'Email address',
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
      onInputChanged: (PhoneNumber value) { setState(() {
        widget.input['phoneNumber'] = value.phoneNumber;
      });},
      onInputValidated: (bool value) {
        widget.functionP(value);
      },
      errorMessage: 'please enter a valid phone number.',
      autoValidateMode: AutovalidateMode.always,
      initialValue: number,
      textFieldController: _phoneTextController,
      formatInput: false,
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        hintText: 'Phone number',
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
      selectorTextStyle: TextStyle(
        color: FeelinColorFamily.blueCore,
      ),
    );
  }
}