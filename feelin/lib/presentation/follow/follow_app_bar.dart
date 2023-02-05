import 'package:flutter/material.dart';

class FollowAppBar extends StatelessWidget with PreferredSizeWidget{
final bool isFollowerPage;
final bool isLikesPage;
const FollowAppBar({Key? key, required this.isFollowerPage, this.isLikesPage = false}) : super(key: key);

@override
Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

@override
Widget build(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
    title: Text(isLikesPage ? 'Likes' : isFollowerPage ? 'Followers':'Following',
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
  );
}
}