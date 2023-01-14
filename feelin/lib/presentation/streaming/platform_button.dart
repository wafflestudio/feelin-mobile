import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget{
  final Icon icon;
  final String label;
  final Function function;
  const PlatformButton({Key? key, required this.function, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: ()=> function(), icon: icon, label: Text(label));
  }
}