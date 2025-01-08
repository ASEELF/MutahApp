import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
class ReusableDropdownWidget extends StatelessWidget {
  final List<String> items; // List of items to display in the dropdown
  final String? selectedValue; // Selected value
  final ValueChanged<String?> onChanged; // Callback when selection changes
  final String hintText; // Hint text for the dropdown

  ReusableDropdownWidget({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorManager.black), // Change focus color
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      hint: Text(
        hintText,
        style: getFirstMediumStyle(color: ColorManager.darkGrey),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Container(
            height: 40,
            alignment: Alignment.centerRight,
            child: Text(
              item,
              style: getFirstRegularStyle(color: ColorManager.lightBlack),
            ),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select a value.';
        }
        return null;
      },
      onChanged: onChanged,
      iconStyleData: IconStyleData(
        icon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Icon(
            Icons.arrow_drop_down,
            color: ColorManager.darkGrey,
            size: 36,
          ),
        ),
      ),
      buttonStyleData: const ButtonStyleData(
          height: 45,
        padding: EdgeInsets.only(right: 8),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}


//after fetching the data from api
// Inside your stateful widget, after fetching data from the API
// Future<void> fetchGenderItems() async {
//   final response = await http.get('your-api-endpoint');
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     setState(() {
//       genderItems = data.map((item) => item.toString()).toList();
//     });
//   } else {
//     // Handle error
//   }
// }

