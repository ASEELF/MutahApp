import 'package:get/get.dart';
class UserController extends GetxController {
  var studentName = ''.obs;
  var studentId = ''.obs;
  var email = ''.obs;
  var studentGender = ''.obs; // Add gender observable

  void setStudentName(String name) {
    studentName.value = name;
  }

  void setStudentId(String id) {
    studentId.value = id;
  }

  void setEmail(String emailAddress) {
    email.value = emailAddress;
  }

  void setStudentGender(String gender) {
    studentGender.value = gender; // Setter for gender
  }
}
