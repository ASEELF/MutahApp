import 'dart:convert';
import 'package:http/http.dart' as http;

class PostponeRequestService {
  final String _baseUrl = 'https://gradprojectbackend-production.up.railway.app/api/students/createPostponeRecord';

  Future<String> createPostponeRecord(String studentId, int noOfSemesters, String reason) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'studentId': studentId,
          'noOfSemesters': noOfSemesters,
          'reason': reason,
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['message'] ?? 'Something went wrong';
      } else {
        return 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
