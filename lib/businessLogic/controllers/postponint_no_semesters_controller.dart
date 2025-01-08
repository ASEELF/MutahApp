import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mutahapplication/data/models/posponing_no_semesters_model.dart';

class PostponeRequestSemestersController extends GetxController {
  var availableSemesters = <int>[].obs;
  var isLoading = false.obs;

  Future<void> fetchPostponingOptions(String studentId) async {
    isLoading.value = true;
    final url = Uri.parse('https://gradprojectbackend-production.up.railway.app/api/students/isAllowedToPostpone/$studentId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final postponingData = PostponingModel.fromJson(data);
        availableSemesters.value = postponingData.availableSemesters;
      } else {
        // Handle the error
        throw Exception("Failed to load postponing options");
      }
    } catch (error) {
      // Handle any other error
      print("Error: $error");
    } finally {
      isLoading.value = false;
    }
  }
}
