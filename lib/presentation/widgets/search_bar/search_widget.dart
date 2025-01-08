import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_bar_widget.dart';
import 'search_result_widget.dart';

class SearchWidget extends StatelessWidget {
  final SearchTextController searchController = Get.put(SearchTextController());
  final GlobalKey<SearchBarWidgetState> searchBarKey = GlobalKey<SearchBarWidgetState>();
  SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SearchBarWidget(key: searchBarKey),
        Obx(() {
          if (searchController.filteredCourses.isEmpty) {
            return SizedBox.shrink();
          }
          return SearchResultWidget(
            filteredCourses: searchController.filteredCourses,
          );
        }),
      ],
    );
  }

  void clearSearchBar() {
    searchBarKey.currentState?.clearTextField();
  }
}

