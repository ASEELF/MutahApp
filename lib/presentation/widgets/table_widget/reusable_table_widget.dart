import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/synchronization_request/table_model.dart';

class EditableTableWidget extends StatefulWidget {
  final List<TableModel> columns; // List of columns with title and keyboard type
  final int numberOfRows; // Number of rows in the table
  final Function(List<List<String>>) onValuesChanged; // Callback for value changes

  const EditableTableWidget({
    Key? key,
    required this.columns,
    required this.numberOfRows,
    required this.onValuesChanged,
  }) : super(key: key);

  @override
  State<EditableTableWidget> createState() => _EditableTableWidgetState();
}

class _EditableTableWidgetState extends State<EditableTableWidget> {
  late List<List<TextEditingController>> controllers;

  @override
  void initState() {
    super.initState();

    // Initialize TextEditingControllers for each cell
    controllers = List.generate(
      widget.numberOfRows,
          (_) => List.generate(
        widget.columns.length,
            (_) => TextEditingController(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    for (var row in controllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  // Notify the parent widget about the changes
  void _updateValues() {
    final values = controllers
        .map(
          (row) => row.map((controller) => controller.text).toList(),
    )
        .toList();
    widget.onValuesChanged(values);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border.all(color: ColorManager.darkGrey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Table(
        border: TableBorder.all(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: [
          // Header row
          TableRow(
            children: widget.columns
                .map(
                  (column) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    column.title,
                    style: getFirstRegularStyle(color: ColorManager.lightBlack),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          // Editable rows
          ...List.generate(
            widget.numberOfRows,
                (rowIndex) => TableRow(
              children: List.generate(
                widget.columns.length,
                    (colIndex) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllers[rowIndex][colIndex],
                    keyboardType: widget.columns[colIndex].keyboardType,
                    decoration: InputDecoration(
                      // Remove the border here to make the TextField borderless
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => _updateValues(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
