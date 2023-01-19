import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget{
  final String title;
  const CommonTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.41
      ),
    );
  }
}