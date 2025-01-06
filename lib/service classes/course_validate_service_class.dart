import 'dart:convert';
import 'package:http/http.dart' as http;
//this is to make a validation on every course ID Entered
class CourseValidationService {
  Future<bool> validateCourseID(String courseId) async {
    try {
      final response = await http.get(Uri.parse('https://api.example.com/validate-course/$courseId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['isValid'];
      } else {
        return false;
      }
    } catch (e) {
      print('Error validating course ID: $e');
      return false;
    }
  }
}
