import 'package:flutter/material.dart';

class SignUpAppBar extends StatelessWidget with PreferredSizeWidget{
  const SignUpAppBar({Key? key, required this.goToBack}) : super(key: key);
  final Function goToBack;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: () => goToBack(), icon: const Icon(Icons.arrow_back_ios_new),),
    );
  }
}