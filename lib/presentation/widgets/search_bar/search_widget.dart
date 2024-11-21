import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_bar_widget.dart';
import 'search_result_widget.dart';  // Import the new widget

class SearchWidget extends StatelessWidget {
  final SearchTextController searchController = Get.put(SearchTextController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SearchBarWidget(),
        Obx(() {
          // Check if the filteredCourses list is not empty before showing the result widget
          if (searchController.filteredCourses.isEmpty) {
            return SizedBox.shrink();
          }

          // Use SearchResultWidget here
          return SearchResultWidget(
            filteredCourses: searchController.filteredCourses,
          );
        }),
      ],
    );
  }
}
