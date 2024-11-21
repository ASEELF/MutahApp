import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds:15 ), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(child:
      Scaffold(

      backgroundColor: ColorManager.transparentcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(ImageAssets.splashLogo),
            ),
            const SizedBox(height: 20), // Add spacing between logo and text
            Text(
              AppStrings.arabictitle, // Arabic title
              style:
              // TextStyle(
              getSecondBoldStyle(color:ColorManager.black )
              ,
              textAlign: TextAlign.center,
            ),
            Text(
              AppStrings.englishtitle, // Arabic title
              style:
              // TextStyle(
              getSecondBoldStyle(color:ColorManager.black )
              ,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
