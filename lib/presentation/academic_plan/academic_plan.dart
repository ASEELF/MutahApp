import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/reusableCard/reusable_card.dart';

class AcademicPlanPage extends StatelessWidget {
  const AcademicPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.academicPlan),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                ReusableCard(
                  text: AppStrings.remedialMaterials,
                  routeName: "/academicPlanDetails",
                ),
                ReusableCard(
                  text: AppStrings.mandotaryMaterials,
                  routeName: "/availableCourses",
                ),
                ReusableCard(
                  text: AppStrings.optionalMaterialsFirstCategory,
                  routeName: "/availableCourses",
                ),
                ReusableCard(
                  text: AppStrings.optionalMaterialsSecondCategory,
                  routeName: "/availableCourses",
                  style: getFirstMediumStyle(color: ColorManager.lightBlack),
                ),
                ReusableCard(
                  text: AppStrings.optionalMaterialsThirdCategory,
                  routeName: "/availableCourses",
                ),
                ReusableCard(
                  text: AppStrings.mandatoryMaterialsCollege,
                  routeName: "/availableCourses",
                ),
                ReusableCard(
                  text: AppStrings.mandatoryMaterialsMajor,
                  routeName: "/availableCourses",
                ),
                ReusableCard(
                  text: AppStrings.optionalMaterialsMajor,
                  routeName: "/availableCourses",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
