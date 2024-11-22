

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';

class SearchResultWidget extends StatelessWidget {
  final List<String> filteredCourses;

  SearchResultWidget({required this.filteredCourses});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 15,
      right: 15,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 250,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: filteredCourses.length,
            itemBuilder: (context, index) {
              String course = filteredCourses[index];
              return GestureDetector(
                onTap: () {
                  switch (course) {
                    case AppStrings.academicPlan:
                      print('Navigating to academic plan');
                      Get.toNamed(Routes.academicPlan); // Navigate to academic plan
                      break;

                    case AppStrings.myRequests:
                      print('Navigating to my requests');
                      Get.toNamed(Routes.myRequestsRoute); // Navigate to my requests
                      break;

                    case AppStrings.schedule:
                      print('Navigating to schedule');
                      Get.toNamed(Routes.schedule); // Navigate to schedule
                      break;

                    case AppStrings.hoursFees:
                      print('Navigating to tuition fees');
                      Get.toNamed(Routes.hoursFees); // Navigate to tuition fees
                      break;

                    case AppStrings.marks:
                      print('Navigating to marks');
                      Get.toNamed(Routes.marks); // Navigate to marks
                      break;

                    default:
                      print('No route found for: $course');
                      break;
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    course,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

