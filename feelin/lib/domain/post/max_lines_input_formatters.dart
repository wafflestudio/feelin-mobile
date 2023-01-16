import 'package:flutter/services.dart';

class MaxLinesInputFormatters extends TextInputFormatter {
  MaxLinesInputFormatters(this.maxLines);

  final int maxLines;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newLineCount = '\n'.allMatches(newValue.text).length + 1;

    if(newLineCount > maxLines){
      return oldValue;
    }

    return newValue;
  }
}