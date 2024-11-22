import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosponingStudiesRequestPage extends StatelessWidget {
  const PosponingStudiesRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'PosponingStudiesRequestPage',
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
          'Posponing Studies Request Page',
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
