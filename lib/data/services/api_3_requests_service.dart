
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService  {
  // 1st API: Check if student is expected to graduate
  Future<bool> checkIfExpectedToGraduate(String studentId) async {
    final url = 'https://gradprojectbackend-production.up.railway.app/api/students/isExpectedToGraduate/$studentId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']['isStudentGraduate'] ?? false;
      } else {
        print('Failed to load graduation status');
        return false;
      }
    } catch (e) {
      print('Error checking graduation status: $e');
      return false;
    }
  }

  // 2nd API: Check if student is pre-graduate
  Future<bool> checkIfPreGraduate(String studentId) async {
    final url = 'https://gradprojectbackend-production.up.railway.app/api/students/isPreGraduate/$studentId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']['isStudentPreGraduate'] ?? false;
      } else {
        print('Failed to load pre-graduation status');
        return false;
      }
    } catch (e) {
      print('Error checking pre-graduation status: $e');
      return false;
    }
  }

  // 3rd API: Check if student is in their first semester
  Future<bool> checkIfFirstSemester(String studentId) async {
    final url = 'https://gradprojectbackend-production.up.railway.app/api/students/isFirstSemester/$studentId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']['isFirstSemester']['eligible'] ?? false;
      } else {
        print('Failed to load first semester status');
        return false;
      }
    } catch (e) {
      print('Error checking first semester status: $e');
      return false;
    }
  }
}
