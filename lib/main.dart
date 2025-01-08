import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/student_data_3_apis_controller.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SearchController());
  Get.put(UserController());

  // Initialize StudentDataController after UserController
  Get.put(StudentDataController());

  runApp(MyApp());
}
