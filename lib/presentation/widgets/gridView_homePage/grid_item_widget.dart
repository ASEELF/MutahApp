import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/models/grid_item_model.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class GridItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final double elevation;

  const GridItemWidget({
    Key? key,
    required this.title,
    required this.iconPath,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorManager.darkGrey,
          width: 0.4,
        ),
        borderRadius: borderRadius,
      ),
      elevation: elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image section (replacing Icon)
          Expanded(
            child: Center(
              child: Image.asset(
                iconPath,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Gray bottom section with text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: ColorManager.darkGrey,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style:  getFirstMediumStyle(color: ColorManager.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
