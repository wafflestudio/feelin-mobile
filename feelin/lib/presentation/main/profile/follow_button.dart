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
                  borderRadius: BorderRadius.circular(18)
              )),
              backgroundColor: widget.isFollowed ? MaterialStateProperty.all(FeelinColorFamily.gray400):MaterialStateProperty.all(Colors.black)
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