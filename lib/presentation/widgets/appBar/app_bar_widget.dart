import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle; // Optional style for the title

  const AppBarWidget({
    Key? key,
    required this.title,
    this.titleStyle, // Allow passing a custom style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.green,
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 26.0), // Space above the title
        child: Stack(
          children: [
            // Back button aligned to the left
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Image.asset(
                  IconAssets.back,
                  width: 28.0,
                  height: 28.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            // Title centered in the AppBar
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: titleStyle ?? getFirstBoldStyle(color: ColorManager.white), // Use custom or default style
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0); // Adjusted height for proper spacing
}
