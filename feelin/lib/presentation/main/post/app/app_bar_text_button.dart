import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class AppBarTextButton extends StatefulWidget{
  final bool disabled;
  final Function function;
  final String? text;
  const AppBarTextButton({Key? key, required this.disabled, required this.function, this.text}) : super(key: key);

  @override
  State<AppBarTextButton> createState() => _AppBarTextButtonState();

}
class _AppBarTextButtonState extends State<AppBarTextButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      //height: 48,
      child: TextButton(
          onPressed: widget.disabled ? null : ()=>widget.function(),
          child: Center(
            child: Text(
              widget.text ?? 'Next',
              style: TextStyle(
                color: widget.disabled ? FeelinColorFamily.redSecondary : FeelinColorFamily.redPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.41,
              ),
            ),
          )),
    );
  }
}