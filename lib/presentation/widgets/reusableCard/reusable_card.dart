import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';

class ReusableCard extends StatelessWidget {
  final String text;
  final String? routeName;
  final TextStyle? style;
  final VoidCallback? onTap; // Optional custom navigation logic
  final bool? showArrow; // Optional parameter to control whether to show the arrow icon
  final String? phoneNumber; // Optional phone number
  final String? universityEmail; // Optional university email
  final String? universityAccount; // Optional university account
  final String? universityWebsite;

  const ReusableCard({
    Key? key,
    required this.text,
    this.routeName,
    this.style,
    this.onTap,
    this.showArrow, // Optional: defaults to null
    this.phoneNumber, // Optional: defaults to null
    this.universityEmail, // Optional: defaults to null
    this.universityAccount, // Optional: defaults to null
    this.universityWebsite, // Optional: defaults to null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GestureDetector(
            onTap: onTap ?? () => Get.toNamed(routeName!),
            // Use custom callback or default navigation
            child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border(
                    right: BorderSide(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: style ??
                          getFirstMediumStyle(color: ColorManager.lightBlack),
                    ),
                    if (showArrow ??
                        true) // If showArrow is null, default to true
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.green,
                      ),
                  ],
                ),
                if (phoneNumber != null) ...[
            SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: ColorManager.green,
            ),
            SizedBox(width: 8),
            Text(
              ' $phoneNumber',
              style: getFirstMediumStyle(color: ColorManager.lightBlack),
            ),
          ],
        ),
        ],
        if (universityEmail != null) ...[
    SizedBox(height: 8),
    Row(
    children: [
    Icon(
    Icons.email,
    color: ColorManager.green,
    ),
    SizedBox(width: 8),
    Text(
    ' $universityEmail',
    style: getFirstMediumStyle(color: ColorManager.lightBlack),
    ),
    ],
    ),
    ],
    if (universityAccount != null) ...[
    SizedBox(height: 8),
    Row(
    children: [
    Icon(
    Icons.facebook,
    color: ColorManager.green,
    ),
    SizedBox(width: 8),
    Text(
    ' $universityAccount',
    style: getFirstMediumStyle(color: ColorManager.lightBlack),
    ),
    ],
    ),
    ],
    if (universityWebsite != null) ...[
    SizedBox(height: 8),
    Row(
    children: [
    Icon(
    Icons.web_outlined,
    color: ColorManager.green,
    ),
    SizedBox(width: 8),
    Text(
    ' $universityWebsite',
    style: getFirstMediumStyle(color: ColorManager.lightBlack),
    ),
    ],
    ),
    ],
    ]),
    )
    ,
    )
    ,
    );
  }
}
