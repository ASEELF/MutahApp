
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/values_manager.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const  EdgeInsets.symmetric(vertical: AppPadding.p14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s21),
        ),
        backgroundColor: ColorManager.green, // Adjust button color
      ),
      child:  Text( AppStrings.logIn ,
        style: getFirstSemiBoldStyle(color: ColorManager.white)// Adjust font size and color
      ),
    );
  }
}
