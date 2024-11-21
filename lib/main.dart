import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SearchController());
  runApp(MyApp());
}