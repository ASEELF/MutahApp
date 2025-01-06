import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/service%20classes/course_validate_service_class.dart';

class SubstituteRequestController extends GetxController {
  // Variable to track selected replacement count
  var selectedReplacementCount = 1.obs;

  // List of controllers for course IDs
  List<TextEditingController> courseIdControllers = [];

  // Instance of the validation service
  final CourseValidationService _validationService = CourseValidationService();

  // Update the controllers based on the selected replacement count
  void updateControllers(int count) {
    while (courseIdControllers.length < count) {
      courseIdControllers.add(TextEditingController());
    }
    while (courseIdControllers.length > count) {
      courseIdControllers.removeLast();
    }
  }

  // Validate all entered course IDs
  Future<bool> validateCourseIDs() async {
    for (int i = 0; i < selectedReplacementCount.value; i++) {
      final courseIdController = courseIdControllers[i];

      if (courseIdController.text.isEmpty) {
        return false; // Validation fails if any course ID is empty
      }

      // Use the validation service to check the course ID
      bool isValid = await _validationService.validateCourseID(courseIdController.text);

      if (!isValid) {
        return false; // Validation fails if any course ID is invalid
      }
    }

    return true; // All course IDs are valid
  }
}
