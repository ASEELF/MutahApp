import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType; // New parameter for keyboard type

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, // Default value for keyboard type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.darkGrey),
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Row(
        children: [
          Container(
            width: 55, // Width of the icon background
            height: 66,
            decoration: BoxDecoration(
              color: ColorManager.darkGrey, // Icon background color
              borderRadius: const BorderRadius.only(
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
              keyboardType: keyboardType, // Use the provided keyboard type
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: label,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove default border
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    bottomLeft: Radius.circular(AppSize.s20),
                  ),
                ),
              ),
              style: getFirstMediumStyle(color: ColorManager.darkGrey), // Adjust font size if needed
            ),
          ),
        ],
      ),
    );
  }
}
