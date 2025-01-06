import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class CustommTextField extends StatelessWidget {
  final String labelText; // Label text for the text field
  final TextEditingController? controller; // Optional controller for managing input
  final TextInputType? keyboardType; // Optional keyboard type
  final bool readOnly; // Optional parameter for making the text field read-only
  final bool useDarkGreyBorder; // Optional parameter for adding a dark grey border
  final bool obscureText; // Optional parameter for obscuring text

  const CustommTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.readOnly = false, // Default value is false
    this.useDarkGreyBorder = false, // Default value is false
    this.obscureText = false, // Default value is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly, // Set the readOnly property based on the parameter
      obscureText: obscureText, // Set the obscureText property based on the parameter
      showCursor: !readOnly, // Show cursor only if the field is editable
      enabled: !readOnly, // Disable the text field if it's read-only
      style: getFirstSemiBoldStyle(color: readOnly ? ColorManager.black : ColorManager.black) ,

      decoration: InputDecoration(
        labelText: labelText,
        filled: true, // Enable background color
        fillColor: readOnly
            ? ColorManager.white // White background for read-only fields
            : ColorManager.white, // White background for editable fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: useDarkGreyBorder
              ? BorderSide(color: ColorManager.mediumgrey, width: 1.0) // Dark grey border
              : BorderSide.none, // No border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: useDarkGreyBorder
                ? ColorManager.darkGrey // Dark grey border when focused
                : ColorManager.darkGrey, // Default behavior
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
