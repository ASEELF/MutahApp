import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class HeaderWidget extends StatelessWidget {
  final String username;
  final GlobalKey<ScaffoldState> scaffoldKey; // Add scaffoldKey as a parameter
  final UserController userController = Get.find();  // Use UserController to fetch the gender

   HeaderWidget({
    required this.username,
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logic to select avatar based on gender
    String avatarImage = userController.studentGender.value == 'F'
        ? ImageAssets.newAvatarFemale
        : ImageAssets.newAvatarMale;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          color: ColorManager.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                  avatarImage,  // Use gender-specific avatar image
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${AppStrings.hello} $username',
                style: getFirstSemiBoldStyle(color: ColorManager.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 45,
          right: 26,
          child: GestureDetector(
            onTap: () {
              print("tapped");
              scaffoldKey.currentState?.openDrawer();  // Use the GlobalKey to open the drawer
            },
            child: Image.asset(
              IconAssets.menu,
              width: 40,
              height: 40,
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}
