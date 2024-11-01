import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.background), // Access the static path directly
              fit: BoxFit.cover,
            ),
          ),
        ),

        child,

      ],
    );
  }
}
