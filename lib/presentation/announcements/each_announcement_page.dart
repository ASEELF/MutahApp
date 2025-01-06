import 'package:flutter/material.dart';

class AnnouncementDetailPage extends StatelessWidget {

  final String content;
  const AnnouncementDetailPage({Key? key,  required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الإعلان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
