import 'package:flutter/material.dart';

class ColorManager {
  static Color transparentcolor = Color.fromARGB(0, 255, 255, 255); // Fully transparent
  static Color red = HexColor.fromHex("#FE4042");
  static Color darkGrey = HexColor.fromHex("#888888");
  static Color lightgrey = HexColor.fromHex("#E0E2DB");
  static Color black = HexColor.fromHex("#000000");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color green = HexColor.fromHex("#00A86B");
  
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}