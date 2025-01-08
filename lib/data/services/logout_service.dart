import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';

class LogoutService {
  static Future<void> logout() async {
    final userController = Get.find<UserController>();

    // Clear user data
    userController.setStudentId('');
    userController.setStudentName('');
    userController.setEmail('');

    // Optionally, you can clear any other stored data here (e.g., token, user session)

    // Navigate to the login page
    Get.offAllNamed(Routes.loginRoute);
  }
}
