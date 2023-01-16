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
  static HexColor red50 = HexColor('#FFE9EC');
  static HexColor red100 = HexColor('#FFC9CD');
  static HexColor red200 = HexColor('#F69390');
  static HexColor red300 = HexColor('#ED6764');
  static HexColor red400 = HexColor('#F6403B');
  static HexColor red500 = HexColor('#FA2618');
  static HexColor red600 = HexColor('#EC151A');
  static HexColor red700 = HexColor('#DA0015');
  static HexColor red800 = HexColor('#CD000C');
  static HexColor red900 = HexColor('#BF0000');
  static HexColor redPrimary = red500;
  static HexColor redSecondary = red50;
  static HexColor orange50 = HexColor('#FFF3E0');
  static HexColor orange100 = HexColor('#FEE0B2');
  static HexColor orange200 = HexColor('#FECC80');
  static HexColor orange300 = HexColor('#FEB64D');
  static HexColor orange400 = HexColor('#FDA627');
  static HexColor orange500 = HexColor('#FD9703');
  static HexColor orange600 = HexColor('#F98B03');
  static HexColor orange700 = HexColor('#F37C02');
  static HexColor orange800 = HexColor('#ED6C02');
  static HexColor orange900 = HexColor('#E45102');
  static HexColor errorDark = orange900;
  static HexColor errorPrimary = orange800;
  static HexColor errorLight = orange700;
}