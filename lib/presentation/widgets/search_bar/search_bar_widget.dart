import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({Key? key}) : super(key: key);

  @override
  SearchBarWidgetState createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textController = TextEditingController();
  final SearchTextController searchController = Get.put(SearchTextController());
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // Adjust width (80% of screen width)
        child: Container(
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
            focusNode: _focusNode,
            controller: _textController,
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
        ),
      ),
    );
  }

  // Method to clear the text field
  void clearTextField() {
    _textController.clear();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
 }
