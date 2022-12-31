import 'package:flutter/material.dart';

import '../../style/colors.dart';

class FollowButton extends StatefulWidget{
  final bool alreadyFollowed;
  final Function function;
  const FollowButton({Key? key, required this.alreadyFollowed, required this.function}) : super(key: key);

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
          onPressed: widget.alreadyFollowed ? null : ()=>widget.function(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )),
              backgroundColor: MaterialStateProperty.resolveWith((states){
                if (states.contains(MaterialState.disabled)) {
                  return FeelinColorFamily.grayscaleGray1;
                }
                if (states.contains(MaterialState.pressed)) {
                  return FeelinColorFamily.blueCore;
                }
                return FeelinColorFamily.blueCore;
              })
          ),
          child: Center(
            child: Text(
              widget.alreadyFollowed ? 'UnFollow':'Follow',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}