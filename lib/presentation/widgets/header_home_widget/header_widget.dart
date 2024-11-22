
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';


class HeaderWidget extends StatelessWidget {
  final String username;

  const HeaderWidget({required this.username, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30, bottom: 25),
          color: ColorManager.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  ImageAssets.avatarFemale,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${AppStrings.hello} $username',
                style: getFirstSemiBoldStyle(color: ColorManager.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        Positioned(
          top: 35,
          right: 26,
          child: GestureDetector(
            onTap: () {
              print("tapped");
              Scaffold.of(context).openDrawer();
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







