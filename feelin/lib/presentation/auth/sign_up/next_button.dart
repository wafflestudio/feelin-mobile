import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class NextButton extends StatefulWidget{
  final bool disabled;
  final Function function;
  const NextButton({Key? key, required this.disabled, required this.function}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();

}
class _NextButtonState extends State<NextButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: widget.disabled ? null : ()=>widget.function(),
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
          child: const Center(
            child: Text(
                'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}