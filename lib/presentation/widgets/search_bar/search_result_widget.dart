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
            itemCount: filteredCourses.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredCourses[index]),
                onTap: () {
                  print('Tapped on: ${filteredCourses[index]}');
                  if (filteredCourses[index] == 'طلباتي') {
                    print('Navigating to myRequestsRoute');
                    Navigator.pushNamed(context, Routes.myRequestsRoute);
                  }
                },
                // Optional: Add icons or trailing widgets for more interactivity
                leading: Icon(Icons.school), // Example icon
                trailing: Icon(Icons.arrow_forward),
              );
            },
          )






        ),
      ),
    );
  }
}
