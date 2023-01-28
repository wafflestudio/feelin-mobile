import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

import 'bouncing_widget.dart';

class NextButton extends StatefulWidget{
  final bool disabled;
  final Function function;
  final EdgeInsetsGeometry? margin;
  final String? text;
  final bool? isLoading;
  const NextButton({Key? key, required this.disabled, required this.function, this.margin, this.text, this.isLoading}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();

}
class _NextButtonState extends State<NextButton> {

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      disabled: widget.disabled || (widget.isLoading != null && widget.isLoading!),
      child: Container(
        margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 32),
        width: MediaQuery.of(context).size.width,
        height: 56,
        child: ElevatedButton(
            onPressed: widget.disabled ? null : (){
              if(widget.isLoading != null && widget.isLoading!) return;
              widget.function();
              },
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
              child: (widget.isLoading != null && widget.isLoading!) ?
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: Colors.white,),
                  )
                  : Text(
                  widget.text ?? 'Next',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )),
      ),
    );
  }
}