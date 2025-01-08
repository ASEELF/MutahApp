import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/marks/eachSemesterMarkPage.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/reusableCard/reusable_card.dart';
import 'package:get/get.dart';

class MarksPage extends StatelessWidget {
  const MarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.marks),
          body: Column(
            children: [
              const SizedBox(height: 15),
              ReusableCard(
                text: AppStrings.transferdCourses,
                routeName: Routes.eachMarksPage,
                onTap: () => Get.to(() => EachSemesterMarksPage(appBarTitle: AppStrings.marks , containerTitle: AppStrings.transferdCourses,)), // Custom logic
              ),
              ReusableCard(
                text: AppStrings.firstSemester20222023,
                routeName: Routes.eachMarksPage,
                onTap: () => Get.to(() => EachSemesterMarksPage(appBarTitle: AppStrings.marks,containerTitle:AppStrings.firstSemester20222023 ,)), // Custom logic
              ),
              ReusableCard(
                text: AppStrings.secondSemester20222023,
                routeName: Routes.eachMarksPage,
                onTap: () => Get.to(() => EachSemesterMarksPage(appBarTitle: AppStrings.marks,containerTitle:AppStrings.secondSemester20222023 ,)), // Custom logic
              ),
            ],
          ),
        ),
      ),
    );
  }
}
