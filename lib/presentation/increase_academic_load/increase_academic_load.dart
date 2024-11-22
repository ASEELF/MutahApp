import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncreaseAcademicLoadRequestPage extends StatelessWidget {
  const IncreaseAcademicLoadRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'IncreaseAcademicLoadRequestPage',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();

          },
        ),
      ),
      body: Center(
        child: Text(
          'Increase Academic Load Request Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
