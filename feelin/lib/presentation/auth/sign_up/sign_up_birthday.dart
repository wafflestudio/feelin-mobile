// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:intl/intl.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_app_bar.dart';
import 'package:music_sns/presentation/auth/sign_up/sign_up_username.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';
import 'common_title.dart';

class SignUpBirthday extends StatefulWidget{
  const SignUpBirthday({Key? key,}) : super(key: key);

  @override
  State<SignUpBirthday> createState() => _SignUpBirthdayState();

}
class _SignUpBirthdayState extends State<SignUpBirthday>{
  TextEditingController yearEditingController = TextEditingController();
  TextEditingController monthEditingController = TextEditingController();
  TextEditingController dayEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  FocusNode monthFocusNode = FocusNode();
  FocusNode dayFocusNode = FocusNode();

  bool isBirthdayValid = false;
  bool hasError = false;

  String year = "";
  String month = '';
  String day = '';

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  bool validateBirthday(){
    if(year.isNotEmpty && month.isNotEmpty && day.isNotEmpty){
      final date = DateTime(int.parse(year), int.parse(month), int.parse(day));
      if(isValidDate('${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}')){
        DateTime today = DateTime.now();
        DateTime maxDate = DateTime(
          date.year + 100,
          date.month,
          date.day,
        );
        return today.isBefore(maxDate);
      }else {
        return false;
      }
    }
    return false;
  }

  bool isValidDate(String input) {
    try {
      final DateTime d = DateFormat('yyyy-MM-dd').parseStrict(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isOver14(DateTime date){
    DateTime today = DateTime.now();
    DateTime minDate = DateTime(
      date.year + 14,
      date.month,
      date.day,
    );
    return minDate.isBefore(today);
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: (){
        context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
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
                  margin: const EdgeInsets.only(top: 30),
                  constraints: const BoxConstraints(maxHeight: 210),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CommonTitle(title: 'When’s your birthday?'),
                      _dateField(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: NextButton(disabled: !isBirthdayValid,
                    function: (){
                      final date = DateTime(int.parse(year), int.parse(month), int.parse(day));
                      if(isOver14(date)){
                        context
                            .read<SignUpFormBloc>()
                            .add(SignUpFormEvent.birthdayChanged(DateFormat('yyyy-MM-dd').format(date)));
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context2){
                            return BlocProvider.value(
                                value: context.read<SignUpFormBloc>(),
                                child: const SignUpUsername());
                          },
                        ),
                        );
                      }else{
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                              backgroundColor: FeelinColorFamily.errorPrimary,
                              icon: const Icon(Icons.music_note, color: Colors.transparent,),
                              message: 'You must be 14+ to use Feelin\'.')
                        );
                      }

                    },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateField(){
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 125,
            child: TextFormField(
              controller: yearEditingController,
              maxLength: 4,
              //textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 10,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onEditingComplete: (){
                FocusScope.of(context).requestFocus(monthFocusNode);
              },
              onChanged: (value) {
                if(value.length == 4){
                  FocusScope.of(context).requestFocus(monthFocusNode);
                }
                setState(() {
                  year = value;
                  isBirthdayValid = validateBirthday();
                });
              },
              autofillHints: const [AutofillHints.birthdayYear],
              decoration: InputDecoration(
                hintText: 'YYYY',
                counterText: '',
                hintStyle: TextStyle(
                  color: FeelinColorFamily.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5,),
          SizedBox(
            width: 80,
            child: TextFormField(
              controller: monthEditingController,
              focusNode: monthFocusNode,
              maxLength: 2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: 10,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.birthdayMonth],
              onEditingComplete: (){
                FocusScope.of(context).requestFocus(dayFocusNode);
              },
              onChanged: (value) {
                if(value.length == 2){
                  FocusScope.of(context).requestFocus(dayFocusNode);
                }
                setState(() {
                  month = value;
                  isBirthdayValid = validateBirthday();
                });
              },
              decoration: InputDecoration(
                hintText: 'MM',
                counterText: '',
                hintStyle: TextStyle(
                  color: FeelinColorFamily.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 8,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5,),
          SizedBox(
            width: 80,
            child: TextFormField(
              controller: dayEditingController,
              focusNode: dayFocusNode,
              maxLength: 2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: 10,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onEditingComplete: (){
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                setState(() {
                  if(value.length == 2){
                    FocusScope.of(context).unfocus();
                  }
                  day = value;
                  isBirthdayValid = validateBirthday();
                });
              },
              autofillHints: const [AutofillHints.birthdayDay],
              decoration: InputDecoration(
                hintText: 'DD',
                counterText: '',
                hintStyle: TextStyle(
                  color: FeelinColorFamily.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}