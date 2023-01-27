import 'package:flutter/material.dart';

import '../../style/colors.dart';

class CommonDescription extends StatelessWidget{
  final String description;
  final bool isRed;
  const CommonDescription({Key? key, required this.description, this.isRed = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isRed ? FeelinColorFamily.redPrimary : Colors.black,
        fontSize: 15,
        fontWeight: isRed ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: -0.41
      ),
    );
  }
}