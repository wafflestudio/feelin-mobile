import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/edit/edit_profile_form/edit_profile_form_bloc.dart';

import '../../../domain/profile/profile.dart';
import '../../main/post/app/app_bar_text_button.dart';

class EditProfileAppBar extends StatelessWidget with PreferredSizeWidget{
  const EditProfileAppBar({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
        builder: (context, state) {
          return AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new), color: Colors.black,),
            title: const Text('Edit post',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              AppBarTextButton(disabled: !((state.username.isValid() && state.username.getOrCrash() == profile.username) ||
                  (state.username.isValid() && state.canUseName)) || !state.name.isValid(), function: (){
                context.read<EditProfileFormBloc>().add(const EditProfileFormEvent.submitted());
              }, text: 'Done',)
            ],
          );
        }
    );
  }
}