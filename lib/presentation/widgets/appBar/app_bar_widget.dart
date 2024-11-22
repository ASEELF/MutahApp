import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorManager.green,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Space above the arrow and title
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
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
            // Expanded(
            //   child:
            const SizedBox(width:108),
                Text(
                title,
                style: getFirstBoldStyle(color: ColorManager.white),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0); // Adjusted height for proper spacing
}
