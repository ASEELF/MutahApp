//
// import 'package:flutter/material.dart';
//
// class CategoryButtonWidget extends StatelessWidget {
//   final String title;
//   final String selectedCategory;
//   final Function(String) onCategorySelected;
//
//   const CategoryButtonWidget({
//     Key? key,
//     required this.title,
//     required this.selectedCategory,
//     required this.onCategorySelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       // style: ElevatedButton.styleFrom(
//       //   primary: title == selectedCategory ? Colors.blue : Colors.grey,
//       // ),
//       onPressed: () => onCategorySelected(title),
//       child: Text(title),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String title;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryButtonWidget({
    Key? key,
    required this.title,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        onCategorySelected(title);
      },
      child: Text(
        title,
        style: isSelected
            ? getFirstMediumStyle(color: Colors.red)
            : getFirstRegularStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
