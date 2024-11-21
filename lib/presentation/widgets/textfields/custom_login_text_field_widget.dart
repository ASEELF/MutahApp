import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.darkGrey),
        borderRadius:  BorderRadius.circular(AppSize.s20)
      ),
      child: Row(
        children: [
          Container(
            width: 55, // Width of the icon background
            height: 63,
            decoration: BoxDecoration(
              color: ColorManager.darkGrey, // Icon background color
              borderRadius: const  BorderRadius.only(
                topRight: Radius.circular(AppSize.s18),
                bottomRight: Radius.circular(AppSize.s18),
              ),
            ),
            alignment: Alignment.center, // Center the icon
            child: Icon(
              icon,
              color: ColorManager.white,
            ),
          ),
          Expanded(
              child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white,
                hintText: label,
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border : OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove default border
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    bottomLeft: Radius.circular(AppSize.s20),
                  ),
                ),
              ),
          style:  getFirstMediumStyle(color: ColorManager.darkGrey)// Adjust font size if needed
            ),
          ),

      ],
      ),

    );

  }
}
