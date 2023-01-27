import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/presentation/style/colors.dart';

class PlatformButton extends StatelessWidget{
  final Widget icon;
  final String label;
  final Function function;
  final bool isBlack;
  const PlatformButton({Key? key, required this.function, required this.label, required this.icon, this.isBlack = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: isBlack ? FeelinColorFamily.gray900 : FeelinColorFamily.gray800, ),
          color: isBlack ? FeelinColorFamily.gray900 : FeelinColorFamily.gray50,
        ),
        width: MediaQuery.of(context).size.width-26,
        height: 56,
        child: ElevatedButton.icon(
            onPressed: ()=> function(),
            icon: icon,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent)
            ),
            label: Text(
                label,
              style: TextStyle(
                color: isBlack ? Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.41,
              ),
            ),
        ),
    );
  }
}