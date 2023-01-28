import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/edit/edit_post_form/edit_post_form_bloc.dart';

import '../../main/post/app/app_bar_text_button.dart';

class EditPostAppBar extends StatelessWidget with PreferredSizeWidget{
  const EditPostAppBar({Key? key,}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPostFormBloc, EditPostFormState>(
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
              AppBarTextButton(disabled: !state.title.isValid(), function: (){
                context.read<EditPostFormBloc>().add(const EditPostFormEvent.submitted());
              }, text: 'Done',)
            ],
          );
        }
    );
  }
}