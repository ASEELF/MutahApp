


import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';

import '../../data/services/api_3_requests_service.dart';

class StudentDataController extends GetxController {
  final UserController userController = Get.find(); // Assuming UserController is already available
  var isExpectedToGraduate = false.obs;
  var isPreGraduate = false.obs;
  var isFirstSemester = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchStudentData();
  }

  void fetchStudentData() async {
    ApiService apiService = ApiService();
    print("Fetching student data...");
    isExpectedToGraduate.value = await apiService.checkIfExpectedToGraduate(userController.studentId.value);


    print("Expected to Graduate: ${isExpectedToGraduate.value}");

    isPreGraduate.value = await apiService.checkIfPreGraduate(userController.studentId.value);
    print("Pre Graduate: ${isPreGraduate.value}");
    isFirstSemester.value = await apiService.checkIfFirstSemester(userController.studentId.value);
    print("First Semester: ${isFirstSemester.value}");
  }
}


