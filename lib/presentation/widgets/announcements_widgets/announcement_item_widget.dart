//

import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class AnnouncementItemWidget extends StatelessWidget {
  final String text;
  final String content;

  const AnnouncementItemWidget({
    Key? key,
    required this.text,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   text,
            //   style: getFirstSemiBoldStyle(color: ColorManager.black),
            // ),
            const SizedBox(height: 10),
            Text(content,style: getFirstMediumStyle(color: ColorManager.black),),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/presentation/my_requests/customized_request_item_builder.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/routes_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
//
// class AnnouncementItemWidget extends StatelessWidget {
//   final String text;
//
//   const AnnouncementItemWidget({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: RequestItemWidget(
//         text: text,
//         routeName:  Routes.eachAnnouncementPage,
//         style: getFirstMediumStyle(color: ColorManager.black),
//       ),
//     );
//   }
// }
//
//
