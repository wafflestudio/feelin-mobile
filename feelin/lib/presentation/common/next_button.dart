import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class NextButton extends StatefulWidget{
  final bool disabled;
  final Function function;
  final EdgeInsetsGeometry? margin;
  final String? text;
  const NextButton({Key? key, required this.disabled, required this.function, this.margin, this.text}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();

}
class _NextButtonState extends State<NextButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
          onPressed: widget.disabled ? null : ()=>widget.function(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28)
            )),
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if (states.contains(MaterialState.disabled)) {
                return FeelinColorFamily.gray400;
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.black;
              }
              return Colors.black;
            })
          ),
          child: Center(
            child: Text(
                widget.text ?? 'Next',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}