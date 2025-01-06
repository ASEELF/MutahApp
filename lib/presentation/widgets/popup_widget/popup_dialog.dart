import 'dart:ui'; // For the ImageFilter
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPrimaryButtonPressed;
  final String primaryButtonText;
  final VoidCallback onSecondaryButtonPressed;
  final String secondaryButtonText;

  const CustomPopup({
    Key? key,
    required this.title,
    required this.description,
    required this.onPrimaryButtonPressed,
    required this.primaryButtonText,
    required this.onSecondaryButtonPressed,
    required this.secondaryButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Blur
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        // Dialog Popup
        Center(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.90, // 90% of screen width
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style:getFirstSemiBoldStyle(color: ColorManager.green)
                    ),
                    const SizedBox(height: 14),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: getFirstRegularStyle(color : ColorManager.black)
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.green,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: onPrimaryButtonPressed,
                      child: Text(
                        primaryButtonText,
                        style: getFirstMediumStyle(color : ColorManager.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side:  BorderSide(color: ColorManager.green),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: onSecondaryButtonPressed,
                      child: Text(
                        secondaryButtonText,

                        style: getFirstMediumStyle(color : ColorManager.green),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
