// import 'package:flutter/material.dart';
// import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
// import 'package:mutahapplication/data/models/login_model.dart';
// import 'package:mutahapplication/data/services/api_service.dart';
// import 'package:get/get.dart';
//
// class LoginController {
//   final ApiService apiService;
//   final UserController userController = Get.put(UserController()); // Create an instance of UserController
//
//   LoginController(this.apiService);
//   Future<LognInResponse?> login(String studentId, String password) async {
//     try {
//       final response = await apiService.login(studentId, password);
//
//       if (response.authenticated) {
//         // Debug the response to check if all data is parsed correctly
//         debugPrint("Response Message: ${response.message}");
//         debugPrint("Student ID: ${response.data.studentId}");
//         debugPrint("Student Name: ${response.data.studentName}");
//         debugPrint("Email: ${response.data.email}");
//
//         // Use individual setters to store the student data in the UserController
//         userController.setStudentId(response.data.studentId);
//         userController.setStudentName(response.data.studentName);
//         userController.setEmail(response.data.email);
//
//         // Debug print the values stored in the UserController
//         debugPrint("UserController Student ID: ${userController.studentId}");
//         debugPrint("UserController Student Name: ${userController.studentName}");
//         debugPrint("UserController Email: ${userController.email}");
//
//         return response;
//       } else {
//         debugPrint(response.message); // Log the message for unsuccessful login
//         return null;
//       }
//     } catch (e) {
//       debugPrint("Login error: $e"); // Catch and log any errors
//       return null;
//     }
//   }
//
//
//
//
// }
//

import 'package:flutter/material.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/data/models/login_model.dart';
import 'package:mutahapplication/data/services/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final ApiService apiService;
  final UserController userController = Get.put(UserController()); // Create an instance of UserController

  LoginController(this.apiService);

  // Method to store credentials in SharedPreferences
  Future<void> storeCredentials(String studentId, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('studentId', studentId);
    await prefs.setString('password', password);
  }

  // Method to load credentials from SharedPreferences
  Future<Map<String, String?>> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentId = prefs.getString('studentId');
    String? password = prefs.getString('password');
    return {'studentId': studentId, 'password': password};
  }

  Future<LognInResponse?> login(String studentId, String password) async {
    try {
      final response = await apiService.login(studentId, password);

      if (response.authenticated) {
        // Debug the response to check if all data is parsed correctly
        debugPrint("Response Message: ${response.message}");
        debugPrint("Student ID: ${response.data.studentId}");
        debugPrint("Student Name: ${response.data.studentName}");
        debugPrint("Email: ${response.data.email}");

        // Use individual setters to store the student data in the UserController
        userController.setStudentId(response.data.studentId);
        userController.setStudentName(response.data.studentName);
        userController.setEmail(response.data.email);

        // Debug print the values stored in the UserController
        debugPrint("UserController Student ID: ${userController.studentId}");
        debugPrint("UserController Student Name: ${userController.studentName}");
        debugPrint("UserController Email: ${userController.email}");

        // Store credentials in SharedPreferences after successful login
        await storeCredentials(studentId, password);

        return response;
      } else {
        debugPrint(response.message); // Log the message for unsuccessful login
        return null;
      }
    } catch (e) {
      debugPrint("Login error: $e"); // Catch and log any errors
      return null;
    }
  }
}
