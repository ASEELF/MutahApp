

import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/widgets/popup_widget/popup_dialog.dart';

void showPopup({
  required BuildContext context,
  required String title,
  String description="",
  required String primaryButtonText,
  required VoidCallback onPrimaryButtonPressed,
  required String secondaryButtonText,
  required VoidCallback onSecondaryButtonPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomPopup(
        title: title,
        description: description,
        primaryButtonText: primaryButtonText,
        onPrimaryButtonPressed: onPrimaryButtonPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryButtonPressed: onSecondaryButtonPressed,
      );
    },
  );
}
