import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/values_manager.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Padding(
          padding:  EdgeInsets.all(20.0), // Set padding on all sides
          child:Image(
            image: AssetImage(ImageAssets.splashLogo),
            height: AppHeight.h130,
        ),
        ),

        SizedBox(width: 1,),
        Column(
          children: [
            Text( AppStrings.arabictitle ,
              style: getSecondSemiBoldStyle(color:ColorManager.black )
                ,
                textAlign: TextAlign.center,
              ),
            Text( AppStrings.englishtitle ,  style: getSecondSemiBoldStyle(color:ColorManager.black )
    ,
    textAlign: TextAlign.center,
    ),

          ],
        )



      ],
    );
  }
}
