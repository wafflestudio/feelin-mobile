import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart';

class SignUpAppBar extends StatelessWidget with PreferredSizeWidget{
  const SignUpAppBar({Key? key, this.reset = false}) : super(key: key);
  final bool reset;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: () {
        if(reset){
          context.read<SignUpFormBloc>().add(const SignUpFormEvent.resetCanUseName());
        }
        Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new),),
    );
  }
}