import 'package:flutter/material.dart';

import '../../style/colors.dart';

class FollowButton extends StatefulWidget{
  final bool isFollowed;
  final Function function;
  const FollowButton({Key? key, required this.isFollowed, required this.function}) : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();

}
class _FollowButtonState extends State<FollowButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: ()=>widget.function(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)
              )),
              backgroundColor: widget.isFollowed ? MaterialStateProperty.all(FeelinColorFamily.gray500):MaterialStateProperty.all(Colors.black)
          ),
          child: Center(
            child: Text(
              widget.isFollowed ? 'Unfollow':'Follow',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}