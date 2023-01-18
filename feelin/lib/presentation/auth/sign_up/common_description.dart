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
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41
      ),
    );
  }
}