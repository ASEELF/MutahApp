import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/widgets/dropdown_widget/drop_down_customized.dart';
import 'package:mutahapplication/presentation/controllers/substitute_controller.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutahapplication/app/show_popup_function.dart';

class IncreaseAcademicLoadRequestPage extends StatefulWidget {
  @override
  _IncreaseAcademicLoadRequestPage createState() => _IncreaseAcademicLoadRequestPage();
}

class _IncreaseAcademicLoadRequestPage extends State<IncreaseAcademicLoadRequestPage> {
  final SubstituteRequestController controller = Get.put(
      SubstituteRequestController());
  String? selectedValue;
  final List<String> items = ["19", "20", "21"];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(
              title: AppStrings.increasingAcademicLoadRequest),
          body: GestureDetector(
            onTap: () {
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
                                AppStrings
                                    .hoursNumberInIncreaseAcademicLoadTitle,
                                style: getFirstMediumStyle(
                                    color: ColorManager.black),
                              ),
                              const SizedBox(height: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Replace this section with the reusable dropdown widget
                                  ReusableDropdownWidget(
                                    items: items,
                                    selectedValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    hintText: AppStrings
                                        .hoursNumberInIncreaseAcademicLoad,
                                  ),
                                  const SizedBox(height: 20.0),
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
                      //here to send the data that student choose to do the request
                      showPopup(
                        context: context,
                        title: AppStrings.increaseAcademicLoadRequestpoUpTitle,
                        description: AppStrings.increaseAcademicLoadRequestpoUpDescription,
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
                      // Call _showPopup on button press
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
                      style: getFirstMediumStyle(color: ColorManager.white),
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

  //
  // void _showPopup({
  //   required BuildContext context,
  //   required String title,
  //   required String description,
  //   required String primaryButtonText,
  //   required VoidCallback onPrimaryButtonPressed,
  //   required String secondaryButtonText,
  //   required VoidCallback onSecondaryButtonPressed,
  // }) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return CustomPopup(
  //         title: title,
  //         description: description,
  //         primaryButtonText: primaryButtonText,
  //         onPrimaryButtonPressed: onPrimaryButtonPressed,
  //         secondaryButtonText: secondaryButtonText,
  //         onSecondaryButtonPressed: onSecondaryButtonPressed,
  //       );
  //     },
  //   );
  // }



}

