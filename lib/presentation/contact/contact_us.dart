import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/controllers/substitute_controller.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/reusableCard/reusable_card.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPage createState() => _ContactUsPage();
}


class _ContactUsPage extends State<ContactUsPage> {
  final SubstituteRequestController controller = Get.put(SubstituteRequestController());

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorManager.transparentcolor,
            appBar: const AppBarWidget(
                title: AppStrings.contactUs),
            body:Column(
                children: [
                const SizedBox(height: 15),
              ReusableCard(
                text:"بيانات التواصل مع الجامعة",
                style: getFirstSemiBoldStyle(color: ColorManager.black),
                  showArrow:false,
                phoneNumber:"+9623-2372-380" ,
                  universityEmail: 'unit_admin@mutah.edu.jo',
                universityAccount:'Mutah University/ جامعة مؤتة',
                universityWebsite: "www.mutah.edu.jo/Home.aspx",
              ),
            ]
            ),
          ),

    )
    );

  }}

