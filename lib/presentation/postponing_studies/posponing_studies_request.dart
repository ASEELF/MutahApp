// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/businessLogic/controllers/postpone_request_controller.dart';
// import 'package:mutahapplication/businessLogic/controllers/postponint_no_semesters_controller.dart';
// import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
// import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
// import 'package:mutahapplication/presentation/widgets/dropdown_widget/drop_down_customized.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/routes_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mutahapplication/app/show_popup_function.dart';
//
// class PosponingStudiesRequestPage extends StatefulWidget {
//   @override
//   _PosponingStudiesRequestPage createState() => _PosponingStudiesRequestPage();
// }
//
// class _PosponingStudiesRequestPage extends State<PosponingStudiesRequestPage> {
//   final PostponeRequestController postponeController = Get.put(PostponeRequestController());
//   final PostponeRequestSemestersController postponeRequestSemestersController = Get.put(PostponeRequestSemestersController());
//   final UserController userController = Get.put(UserController());
//   String? selectedValue;
//   final TextEditingController reasonController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch available semesters when the screen is loaded
//     postponeRequestSemestersController.fetchPostponingOptions(userController.studentId.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundWidget(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: ColorManager.transparentcolor,
//           appBar: AppBarWidget(title: AppStrings.postponingStudiesRequest),
//           body: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: Stack(
//               children: [
//                 Column(
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 AppStrings.numbersOfSemestersNeededToPostpone,
//                                 style: getFirstMediumStyle(color: ColorManager.black),
//                               ),
//                               const SizedBox(height: 20.0),
//                               // Dropdown for semesters
//                               Obx(() {
//                                 if (postponeRequestSemestersController.isLoading.value) {
//                                   return Center(child: CircularProgressIndicator());
//                                 }
//
//                                 if (postponeRequestSemestersController.availableSemesters.isEmpty) {
//                                   return Center(
//                                     child: Text(
//                                       "لا توجد فصول متاحة للتأجيل",
//                                       style: getFirstMediumStyle(color: ColorManager.red),
//                                     ),
//                                   );
//                                 }
//                                 return ReusableDropdownWidget(
//                                   items: postponeRequestSemestersController.availableSemesters
//                                       .map((e) => e.toString())
//                                       .toList(),
//                                   selectedValue: selectedValue,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedValue = value;
//                                     });
//                                     print("Selected number of semesters: $value");
//                                   },
//                                   hintText: AppStrings.numbersOfSemesters,
//                                 );
//                               }),
//                               const SizedBox(height: 15.0),
//                               Text(
//                                 AppStrings.reasons,
//                                 style: getFirstMediumStyle(color: ColorManager.black),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Container(
//                                 height: 150.0,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   border: Border.all(
//                                     color: ColorManager.black,
//                                     width: 1.0,
//                                   ),
//                                 ),
//                                 child: TextField(
//                                   controller: reasonController,
//                                   maxLines: null,
//                                   expands: true,
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.all(12.0),
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 20.0),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 50.0,
//                   left: 17.0,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (selectedValue == null) {
//                         // Optionally, show a snackbar or an alert that the user needs to select a semester
//                         showPopup(
//                           context: context,
//                           title: "تأكد من اختيار عدد الفصول",
//                           primaryButtonText: AppStrings.ok,
//                           onPrimaryButtonPressed: () async {
//                             Get.offNamed(Routes.postponingStudiesRequest);
//                           },
//                         );
//                       }
//
//                       // Show the confirmation popup with the selected semester value
//                       showPopup(
//                         context: context,
//                         title: "هل أنت متأكد أنك بحاجة للتأجيل لمدة $selectedValue فصول؟",
//                         primaryButtonText: AppStrings.yes,
//                         onPrimaryButtonPressed: () async {
//                           // Trigger API call
//                           await postponeController.submitPostponeRequest(
//                             userController.studentId.value,  // Student ID from your controller
//                             int.parse(selectedValue!),       // Selected number of semesters
//                             reasonController.text,           // Reason from the text field
//                           );
//                         },
//                         secondaryButtonText: AppStrings.no,
//                         onSecondaryButtonPressed: () {
//                           Get.offNamed(Routes.mainRoute);
//                         },
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorManager.green,
//                       padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: Text(
//                       AppStrings.submitRequest,
//                       style: getFirstMediumStyle(color: ColorManager.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/businessLogic/controllers/postpone_request_controller.dart';
import 'package:mutahapplication/businessLogic/controllers/postponint_no_semesters_controller.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/dropdown_widget/drop_down_customized.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutahapplication/app/show_popup_function.dart';

class PosponingStudiesRequestPage extends StatefulWidget {
  @override
  _PosponingStudiesRequestPage createState() => _PosponingStudiesRequestPage();
}

class _PosponingStudiesRequestPage extends State<PosponingStudiesRequestPage> {
  final PostponeRequestSemestersController postponeRequestSemestersController = Get.put(PostponeRequestSemestersController());
  final PostponeRequestController postponeController = Get.put(PostponeRequestController());
  final UserController userController = Get.put(UserController());
  String? selectedValue;
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch available semesters when the screen is loaded
    postponeRequestSemestersController.fetchPostponingOptions(userController.studentId.value);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: AppBarWidget(title: AppStrings.postponingStudiesRequest),
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
                                AppStrings.numbersOfSemestersNeededToPostpone,
                                style: getFirstMediumStyle(color: ColorManager.black),
                              ),
                              const SizedBox(height: 20.0),
                              // Dropdown for semesters
                              Obx(() {
                                if (postponeRequestSemestersController.isLoading.value) {
                                  return Center(child: CircularProgressIndicator());
                                }

                                if (postponeRequestSemestersController.availableSemesters.isEmpty) {
                                  return Center(
                                    child: Text(
                                      "لا توجد فصول متاحة للتأجيل",
                                      style: getFirstMediumStyle(color: ColorManager.red),
                                    ),
                                  );
                                }
                                return ReusableDropdownWidget(
                                  items: postponeRequestSemestersController.availableSemesters
                                      .map((e) => e.toString())
                                      .toList(),
                                  selectedValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                    print("Selected number of semesters: $value");
                                  },
                                  hintText: AppStrings.numbersOfSemesters,
                                );
                              }),
                              const SizedBox(height: 15.0),
                              Text(
                                AppStrings.reasons,
                                style: getFirstMediumStyle(color: ColorManager.black),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: ColorManager.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextField(
                                  controller: reasonController,
                                  maxLines: null,
                                  expands: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(12.0),
                                    border: InputBorder.none,
                                  ),
                                ),
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
                      // Submit request logic
                      showPopup(
                          context: context,
                          title: AppStrings.postponeStudtRequestpoUpTitle,
                          primaryButtonText: AppStrings.substituteRequestPopUpPrimaryButtonText,
                          onPrimaryButtonPressed: () async {
                            final Uri url = Uri.parse('https://www.mutah.edu.jo/Home.aspx');
                            if (await launchUrl(url)) {
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not open the website.')));
                            }
                          },
                          secondaryButtonText: AppStrings.substituteRequestPopUpSecondaryButtonText,
                          onSecondaryButtonPressed: () {
                            Get.offNamed(Routes.mainRoute);
                          },
                         );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.green,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
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
}

