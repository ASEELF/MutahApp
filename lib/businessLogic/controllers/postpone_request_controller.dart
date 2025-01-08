import 'package:get/get.dart';
import 'package:mutahapplication/data/services/postpone_request_submit_service_api.dart';


class PostponeRequestController extends GetxController {
  final PostponeRequestService postponeRequestService = PostponeRequestService();

  // Call this function to make the API request
  Future<void> submitPostponeRequest(String studentId, int noOfSemesters, String reason) async {
    String message = await postponeRequestService.createPostponeRecord(studentId, noOfSemesters, reason);

    // You can display the message or handle it as per your app's flow
    Get.snackbar("Request Status", message, snackPosition: SnackPosition.BOTTOM);
  }



}
