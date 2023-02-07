import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/presentation/main/post/app/app_bar_text_button.dart';

class PostAppBar extends StatelessWidget with PreferredSizeWidget{
  final int currPage;
  final Function goToNext;
  const PostAppBar({Key? key, required this.currPage, required this.goToNext}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostFormBloc, PostFormState>(
      builder: (context, state) {
        return AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
          title: const Text('New post',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            if(currPage == 2) AppBarTextButton(disabled: false, function: (){
              goToNext();
            }, ),
            if(currPage == 3) AppBarTextButton(disabled: !state.title.isValid(), function: (){
              goToNext();
            }, text: 'Post',)
          ],
        );
      }
    );
  }
}