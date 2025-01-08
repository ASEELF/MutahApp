import 'dart:ui'; // For using BackdropFilter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/show_popup_function.dart';
import 'package:mutahapplication/presentation/widgets/dropdown_widget/drop_down_customized.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/controllers/substitute_controller.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/popup_widget/popup_dialog.dart';
import 'package:mutahapplication/presentation/widgets/textfields/custome_text_fields_requests.dart';

class SubstitueRequestPage extends StatefulWidget {
  @override
  _SubstitueRequestPageState createState() => _SubstitueRequestPageState();
}

class _SubstitueRequestPageState extends State<SubstitueRequestPage> {
  final SubstituteRequestController controller = Get.put(SubstituteRequestController());

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.substituteCourseRequest),
          body: GestureDetector(
            onTap: () {
              // Dismiss keyboard
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              Text(
                                AppStrings.subjectNumbers,
                                style: getFirstMediumStyle(color: ColorManager.black),
                              ),
                              const SizedBox(height: 4.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RadioListTile<int>(
                                    title: Text('1', style: getFirstMediumStyle(color: ColorManager.black)),
                                    value: 1,
                                    groupValue: controller.selectedReplacementCount.value,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.selectedReplacementCount.value = value!;
                                      });
                                    },
                                    activeColor: ColorManager.green,
                                  ),
                                  RadioListTile<int>(
                                    title: Text('2', style: getFirstMediumStyle(color: ColorManager.black)),
                                    value: 2,
                                    groupValue: controller.selectedReplacementCount.value,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.selectedReplacementCount.value = value!;
                                      });
                                    },
                                    activeColor: ColorManager.green,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Obx(() {
                                return Column(
                                  children: List.generate(
                                    controller.selectedReplacementCount.value,
                                        (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.originalCourseNameAndNumber ,
                                            style: getFirstMediumStyle(color: ColorManager.black),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustommTextField(
                                                  labelText: '${AppStrings.courseId} ${index + 1}',
                                                  keyboardType: TextInputType.number,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: CustommTextField(
                                                  labelText: '${AppStrings.courseName} ${index + 1}',
                                                  keyboardType: TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
                    onPressed: ()  async {
                      // if (controller.selectedReplacementCount.value == 0) {
                      //   // Show an error if no radio button is selected
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please select the number of courses.')),
                      //   );
                      //   return;
                      // }
                      // // Validate course IDs
                      // bool isValid = await controller.validateCourseIDs();
                      //
                      // if (isValid) {
                      //   _showPopup(context); // Show popup if validation passes
                      // } else {
                      //   // Show an error message if validation fails
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('One or more course IDs are invalid.')),
                      //   );
                      // }
                      showPopup(
                        context: context,
                        title: AppStrings.substituteRequestpoUpTitle,
                        description: AppStrings
                            .substituteRequestPopUpDescription,
                        primaryButtonText: AppStrings
                            .substituteRequestPopUpPrimaryButtonText,
                        onPrimaryButtonPressed: () async {
                          final Uri url = Uri.parse(
                              'https://www.mutah.edu.jo/Home.aspx');
                          if (await launchUrl(url)) {
                            await launchUrl(
                                url, mode: LaunchMode.externalApplication);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Could not open the website.')),
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
                      backgroundColor:ColorManager.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child:  Text(
                      AppStrings.submitRequest,
                      style: getFirstMediumStyle(color:ColorManager.white ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _showPopup function to show the dialog with blur effect
  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomPopup(
          title: AppStrings.substituteRequestpoUpTitle,
          description: AppStrings.substituteRequestPopUpDescription,
          primaryButtonText: AppStrings.substituteRequestPopUpPrimaryButtonText,
          onPrimaryButtonPressed : ( )async {
            final Uri url = Uri.parse('https://www.mutah.edu.jo/Home.aspx');
            if (await launchUrl(url)) {
              await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
               launchUrl(url);
                  //, mode: LaunchMode.externalApplication);
            } else {
              // Handle error if the URL cannot be launched
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not open the website.')),
              );
            }
          },
          secondaryButtonText: AppStrings.substituteRequestPopUpSecondaryButtonText,
          onSecondaryButtonPressed: () {
            Get.offNamed(Routes.mainRoute);
          },
        );
      },
    );
  }

}
