import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';

class HexColorToColor extends Color {
  static int _getColorFromHex(String hexColor) {
    return int.parse(hexColor, radix: 16);
  }
  HexColorToColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class FeelinColorFamily {
  static HexColor grayscaleGray1 = HexColor('#C0C0C0');
  static HexColor grayscaleGray2 = HexColor('#808080');

  static HexColor blueCore = HexColor('#3B88FC');
  static HexColor redCore = HexColor('#BE4444');


}
