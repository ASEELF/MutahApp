import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.green,
    primaryColorLight: ColorManager.lightgrey,
    primaryColorDark: ColorManager.darkGrey,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.lightgrey,
  );}
    //
    // // Card theme
    // cardTheme: CardTheme(
    //   color: ColorManager.white,
    //   shadowColor: ColorManager.lightgrey,
    //   elevation: AppSize.s4,
    // ),
    //
    // // App bar theme
    // appBarTheme: AppBarTheme(
    //   centerTitle: true,
    //   color: ColorManager.green,
    //   elevation: AppSize.s4,
    //   shadowColor: ColorManager.lightgrey,
    //   titleTextStyle: getRegularStyle(
    //     color: ColorManager.white,
    //     fontSize: AppSize.s16,
    //   ),
    // ),
    //
    // // Button theme
    // buttonTheme: ButtonThemeData(
    //   shape: const StadiumBorder(),
    //   disabledColor: ColorManager.darkGrey,
    //   buttonColor: ColorManager.green,
    //   splashColor: ColorManager.lightgrey,
    // ),
    //
    // // Elevated button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: getRegularStyle(color: ColorManager.white),
    //     primary: ColorManager.green,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(AppSize.s12),
    //     ),
    //   ),
    // ),
    //
    // // Text button theme
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     primary: ColorManager.green,
    //     textStyle: getRegularStyle(color: ColorManager.green),
    //   ),
    // ),
    //
    // // Outlined button theme
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     primary: ColorManager.green,
    //     side: BorderSide(color: ColorManager.green, width: AppSize.s1_5),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(AppSize.s12),
    //     ),
    //     textStyle: getRegularStyle(color: ColorManager.green),
    //   ),
    // ),
    //
    // // Text theme
    // textTheme: TextTheme(
    //   headline1: getSemiBoldStyle(
    //     color: ColorManager.darkGrey,
    //     fontSize: AppSize.s16,
    //   ),
    //   subtitle1: getMediumStyle(
    //     color: ColorManager.lightgrey,
    //     fontSize: AppSize.s14,
    //   ),
    //   caption: getRegularStyle(color: ColorManager.darkGrey),
    //   bodyText1: getRegularStyle(color: ColorManager.darkGrey),
    // ),

    // Input decoration theme (for TextFields)
    //    inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   hintStyle: getRegularStyle(color: ColorManager.darkGrey),
    //   labelStyle: getMediumStyle(color: ColorManager.darkGrey),
    //   errorStyle: getRegularStyle(color: ColorManager.red),

      // Enabled border
  //     enabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.lightgrey, width: AppSize.s1_5),
  //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
  //     ),
  //
  //     // Focused border
  //     focusedBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.green, width: AppSize.s1_5),
  //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
  //     ),
  //
  //     // Error border
  //     errorBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1_5),
  //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
  //     ),
  //
  //     // Focused error border
  //     focusedErrorBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.green, width: AppSize.s1_5),
  //       borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
  //     ),
  //   ),
  // );

