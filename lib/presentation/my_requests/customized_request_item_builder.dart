import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class RequestItemWidget extends StatelessWidget {
  final String text;
  final String routeName;

  const RequestItemWidget({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => Get.toNamed(routeName),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border(
              bottom: BorderSide(
                color: ColorManager.green,
                width: 7.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightgrey,
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: getFirstSemiBoldStyle(color: ColorManager.lightBlack),
              //textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
