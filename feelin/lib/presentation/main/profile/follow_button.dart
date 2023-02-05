import 'package:flutter/material.dart';

import '../../style/colors.dart';

class FollowButton extends StatefulWidget{
  final bool isFollowed;
  final Function function;
  final bool isSmall;
  const FollowButton({Key? key, required this.isFollowed, required this.function, this.isSmall = false}) : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();

}
class _FollowButtonState extends State<FollowButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.isSmall ? 110 : double.infinity,
      height: widget.isSmall ? 30 : 36,
      child: ElevatedButton(
          onPressed: (){
            widget.function();
            },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
              )),
              side: widget.isFollowed ? MaterialStateProperty.all(BorderSide(width: 1, color: FeelinColorFamily.gray800)) : null,
              backgroundColor: widget.isFollowed ? MaterialStateProperty.all(FeelinColorFamily.gray50):MaterialStateProperty.all(Colors.black),
              overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
          child: Center(
            child: Text(
              widget.isFollowed ? 'Unfollow':'Follow',
              style: TextStyle(
                color: widget.isFollowed ? Colors.black : Colors.white,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}