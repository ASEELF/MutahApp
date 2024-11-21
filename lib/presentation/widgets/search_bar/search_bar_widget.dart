


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';

class SearchBarWidget extends StatelessWidget {
  // Initialize the controller once.
  final SearchTextController searchController = Get.put(SearchTextController());

  SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          searchController.updateSearchText(value);
        },
        style: getFirstMediumStyle(color: ColorManager.darkGrey),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: AppStrings.search,
          prefixIcon: Icon(Icons.search, color: ColorManager.darkGrey),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorManager.darkGrey,
              width: 0.4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorManager.darkGrey,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}


