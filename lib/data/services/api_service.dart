import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import '../models/login_model.dart';

class ApiService {
  final String baseUrl = "https://gradprojectbackend-production.up.railway.app/api";
  Future<LognInResponse> login(String studentId, String password) async {
    final url = Uri.parse("$baseUrl/students/login");
    final UserController userController = Get.put(UserController());
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"Student_ID": studentId, "Password": password}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final loginResponse = LognInResponse.fromJson(jsonResponse);

        // Update user details in the controller
        userController.setStudentName(loginResponse.data.studentName);
        userController.setStudentId(loginResponse.data.studentId);
        userController.setEmail(loginResponse.data.email);
        userController.setStudentGender(loginResponse.data.studentGender); // Set gender

        return loginResponse;
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred during login: $e");
    }
  }
}

//
//
// class ApiService {
//   final String baseUrl = "https://gradprojectbackend-production.up.railway.app/api";
//   final UserController userController = Get.put(UserController());
//
//   Future<LognInResponse> login(String studentId, String password) async {
//     final url = Uri.parse("$baseUrl/students/login");
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({"Student_ID": studentId, "Password": password}),
//       );
//
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final loginResponse = LognInResponse.fromJson(jsonResponse);
//
//         // Update user details in the controller
//         userController.setStudentName(loginResponse.data.studentName);
//         userController.setStudentId(loginResponse.data.studentId);
//         userController.setEmail(loginResponse.data.email);
//         userController.setStudentGender(loginResponse.data.studentGender); // Set gender
//
//         return loginResponse;
//       } else {
//         throw Exception("Failed to login: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error occurred during login: $e");
//     }
//   }
// }
