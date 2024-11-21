import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}


// regular style for 2 fonts

TextStyle getFirstRegularStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.firstFontFamily, FontWeightManager.regular, color);
}

TextStyle getSecondRegularStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.secondFontFamily, FontWeightManager.regular, color);
}


// medium text style for 2 fonts

TextStyle getFirstMediumStyle(
    {double fontSize = FontSize.s22, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.firstFontFamily, FontWeightManager.medium, color);
}


TextStyle getSecondMediumStyle(
    {double fontSize = FontSize.s22, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.secondFontFamily, FontWeightManager.medium, color);
}

// semi bold text style for 2 fonts

TextStyle getFirstSemiBoldStyle(
    {double fontSize = FontSize.s28, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.firstFontFamily, FontWeightManager.semiBold, color);
}


TextStyle getSecondSemiBoldStyle(
    {double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.secondFontFamily, FontWeightManager.semiBold, color);
}

// bold text style for 2 fonts

TextStyle getFirstBoldStyle(
    {double fontSize = FontSize.s34, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.firstFontFamily, FontWeightManager.bold, color);
}


TextStyle getSecondBoldStyle(
    {double fontSize = FontSize.s26, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.secondFontFamily, FontWeightManager.bold, color);
}

// black text style for 2 fonts

TextStyle getFirstBlackStyle(
    {double fontSize = FontSize.s32, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.firstFontFamily, FontWeightManager.black, color);
}


TextStyle getSecondBlackStyle(
    {double fontSize = FontSize.s32, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.secondFontFamily, FontWeightManager.black, color);
}








