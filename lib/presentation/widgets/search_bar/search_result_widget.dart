import 'package:flutter/material.dart';
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
            print('Building item: ${filteredCourses[index]}');
            return GestureDetector(
              onTap: () {
                print('Tapped on: ${filteredCourses[index]}');
                if (filteredCourses[index] == AppStrings.myRequests) {
                  print('Navigating to myRequestsRoute');
                  Navigator.pushNamed(context, Routes.myRequestsRoute);
                }
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  filteredCourses[index],
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
