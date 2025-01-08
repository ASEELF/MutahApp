import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/synchronization_request/table_model.dart';
import 'package:mutahapplication/presentation/widgets/table_widget/reusable_table_widget.dart';


class EachSemesterMarksPage extends StatelessWidget {
  final String? appBarTitle; // Make the title nullable
  final String? containerTitle;

  const EachSemesterMarksPage({Key? key, this.appBarTitle, this.containerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the table columns
    final List<TableModel> columns = [
      TableModel(title: 'اسم المادة', keyboardType: TextInputType.text),
      TableModel(title: 'رقم المادة', keyboardType: TextInputType.number),
      TableModel(title: 'عدد الساعات', keyboardType: TextInputType.number),
      TableModel(title: 'العلامة النهائية', keyboardType: TextInputType.number),
    ];

    // Define the callback for handling value changes
    void onValuesChanged(List<List<String>> values) {
      // Handle the updated table values here
      debugPrint(values.toString());
    }

    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.transparentcolor,
          appBar: AppBarWidget(
            title: appBarTitle ?? AppStrings.noRouteFound, // Provide a fallback value
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity, // Full width of the screen
                  height: 60.0, // Set the height to 60 pixels
                  decoration: BoxDecoration(
                    color: Colors.white, // White background
                    border: Border.all(color: Colors.black, width: 1.0), // Black border
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0), // Inner padding
                  child: Text(
                    containerTitle ?? 'Default Title',
                    style: getFirstMediumStyle(color: ColorManager.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add spacing
              // Add the editable table here
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EditableTableWidget(
                    columns: columns,
                    numberOfRows: 5, // Specify the number of rows
                    onValuesChanged: onValuesChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
