import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class CommonDescription extends StatelessWidget{
  final String description;
  final bool isGrey;
  const CommonDescription({Key? key, required this.description, this.isGrey = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isGrey ? FeelinColorFamily.grayscaleGray1 : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}