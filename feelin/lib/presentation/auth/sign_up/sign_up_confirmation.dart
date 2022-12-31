import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';
import 'package:music_sns/presentation/auth/sign_up/confirmation_tab_bar.dart';

import 'common_description.dart';
import 'common_title.dart';
import '../../common/next_button.dart';

class SignUpConfirmation extends StatefulWidget{
  final Map input;
  final Function goToNext;
  const SignUpConfirmation({Key? key, required this.input, required this.goToNext}) : super(key: key);

  @override
  State<SignUpConfirmation> createState() => _SignUpNameState();

}
class _SignUpNameState extends State<SignUpConfirmation> with TickerProviderStateMixin{

  final TextEditingController _nameTextController = TextEditingController();
  late TabController _tabController;
  bool enabledP = false;
  bool enabledE = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose(){
    _nameTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CommonTitle(title: 'Enter Your Phone or Email'),
        const SizedBox(height: 10,),
        ConfirmationTabBar(input: widget.input, functionP: (val)=>setState(()=>enabledP = val), functionE: (val)=>setState(()=>enabledE = val) , tabController: _tabController,),
        const SizedBox(height: 10,),
        NextButton(disabled: _tabController.index == 0 ? true : !enabledE,
          function: (){
            // 인증요청
            if(_tabController.index == 0){
              // phone
            }else{
              // email
              context
                  .read<SignUpFormBloc>()
                  .add(const SignUpFormEvent.requested());
            }
            // 요청 성공 시 goToNext();
            widget.goToNext();
          },)
      ],
    );
  }


}