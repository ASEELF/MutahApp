import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/controllers/substitute_controller.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/synchronization_request/table_model.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/table_widget/reusable_table_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutahapplication/app/show_popup_function.dart';

class SynchronizationRequestPage extends StatefulWidget {
  @override
  _SynchronizationRequestPage createState() => _SynchronizationRequestPage();
}

class _SynchronizationRequestPage extends State<SynchronizationRequestPage> {
  final SubstituteRequestController controller =
  Get.put(SubstituteRequestController());
  String? selectedValue;
  //final columnTitles = [AppStrings.courseId, AppStrings.courseName, AppStrings.courseSection];
  final List<TableModel> items = [
    TableModel(title: AppStrings.courseId, keyboardType: TextInputType.number ),
    TableModel(title:AppStrings.courseName, keyboardType: TextInputType.name),
    TableModel(title: AppStrings.courseSection, keyboardType:TextInputType.number),
  ];
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorManager.transparentcolor,
                appBar: const AppBarWidget(
                    title: AppStrings.synchronizationCoursesRequest)
                ,
                body
                    :
                GestureDetector
                  (
                    onTap:
                        () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },

                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      const SizedBox(height: 8.0),
                                      Text(
                                        AppStrings
                                            .synchronizationRequestQuestionAboutOriginalCourse,
                                        style: getFirstMediumStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          EditableTableWidget(
                                            columns: items,
                                            numberOfRows: 1,
                                            onValuesChanged: (values) {
                                              print(values);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0),

                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30.0),
                          ],
                        ),
                        Positioned(
                          bottom: 50.0,
                          left: 17.0,
                          child: ElevatedButton(
                            onPressed: () async {

                              showPopup(
                                context: context,
                                title: AppStrings.synchronizationCoursesRequestpoUpTitle,
                                description: AppStrings
                                    .synchronizationCoursesRequestpoUpDescription,
                                primaryButtonText: AppStrings
                                    .substituteRequestPopUpPrimaryButtonText,
                                onPrimaryButtonPressed: () async {
                                  final Uri url = Uri.parse(
                                      'https://www.mutah.edu.jo/Home.aspx');
                                  if (await launchUrl(url)) {
                                    await launchUrl(
                                        url,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Could not open the website.')),
                                    );
                                  }
                                },
                                secondaryButtonText: AppStrings
                                    .substituteRequestPopUpSecondaryButtonText,
                                onSecondaryButtonPressed: () {
                                  Get.offNamed(Routes.mainRoute);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              AppStrings.submitRequest,
                              style: getFirstMediumStyle(
                                  color: ColorManager.white),
                            ),
                          ),
                        ),
                      ]
                      ,
                    )
                ))));
  }
}



























