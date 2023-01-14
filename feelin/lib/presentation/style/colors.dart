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
  static HexColor grayscaleGray3 = HexColor('F8F8F8');
  static HexColor gray50 = HexColor('#FAFAFA');
  static HexColor gray100 = HexColor('#F5F5F5');
  static HexColor gray200 = HexColor('#EEEEEE');
  static HexColor gray300 = HexColor('#E0E0E0');
  static HexColor gray400 = HexColor('#BDBDBD');
  static HexColor gray500 = HexColor('#9E9E9E');
  static HexColor gray600 = HexColor('#757575');
  static HexColor gray700 = HexColor('#616161');
  static HexColor gray800 = HexColor('#424242');
  static HexColor gray900 = HexColor('#212121');
  static HexColor grayDivider = HexColor('D9D9D9');
  static HexColor grayBorder = HexColor('CECECE');
  static HexColor blueCore = HexColor('#3B88FC');
  static HexColor redCore = HexColor('#BE4444');


}
