import 'package:flutter/material.dart';

class AppColors {
  static Color textColor = HexColor.fromHex("#2F3A59");
  static Color grey = HexColor.fromHex("#E3E3E5");
  static Color shadowColor = HexColor.fromHex("#6E6E6E");
  static Color backButtonBorder = HexColor.fromHex("#DADADA");
  static Color labelTextColor = HexColor.fromHex("#555555");
  static Color  white = HexColor.fromHex("#FDFDFD");
  static Color whiteText = HexColor.fromHex("#FFFFFF");
  static Color toggleIcon = HexColor.fromHex("#909090");
  static Color darkBlue = HexColor.fromHex("#2C2CFF");
  static Color lightGrey = HexColor.fromHex("#F1F1F5");
  static Color darkBlueWithOpacity = HexColor.fromHex("#6B2C2CFF");
  static Color orange = HexColor.fromHex("#FF928F");
  static Color mediumGrey = HexColor.fromHex("#7C7C7C");
  static Color blueGrey = HexColor.fromHex("#8696BB");
  static Color red = HexColor.fromHex("#FF0000");
  static Color pastelBlueColor = HexColor.fromHex("#F3F6FF");
  static Color pureBlackWithOpacity = HexColor.fromHex("#000000AD");
  static Color cursedBlack = HexColor.fromHex("#131313");
  static Color onlineColor = HexColor.fromHex("#55A99D");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}