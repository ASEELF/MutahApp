


import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';

import '../../data/services/api_3_requests_service.dart';

class StudentDataController extends GetxController {
  final UserController userController = Get.find(); // Assuming UserController is already available
  var isExpectedToGraduate = false.obs;
  var isPreGraduate = false.obs;
  var isFirstSemester = false.obs;

  var isEligibleToPostpone = false.obs; // Eligibility from first semester API
  var eligibilityReason = "".obs; // Reason from first semester API
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

    final firstSemesterData = await apiService.checkIfFirstSemester(userController.studentId.value);
    isFirstSemester.value = firstSemesterData['eligible']; // Eligible status
    isEligibleToPostpone.value = firstSemesterData['eligible'];
    eligibilityReason.value = firstSemesterData['reason']; // Reason from the API


    print("First Semester : ${isFirstSemester.value}");
    print("First Semester Eligible: ${isEligibleToPostpone.value}");
    print("Reason: ${eligibilityReason.value}");

  }
}


