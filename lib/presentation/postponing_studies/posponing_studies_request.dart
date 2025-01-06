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

class PosponingStudiesRequestPage extends StatefulWidget {
  @override
  _PosponingStudiesRequestPage createState() => _PosponingStudiesRequestPage();
}

class _PosponingStudiesRequestPage
    extends State<PosponingStudiesRequestPage> {
  final SubstituteRequestController controller =
  Get.put(SubstituteRequestController());
  String? selectedValue;
  final List<String> items = ["1", "2", "3","4"];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(
              title: AppStrings.postponingStudiesRequest),
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
                                    .numbersOfSemestersNeededToPostpone,
                                style: getFirstMediumStyle(
                                    color: ColorManager.black),
                              ),
                              const SizedBox(height: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableDropdownWidget(
                                    items: items,
                                    selectedValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    hintText: AppStrings.numbersOfSemesters,
                                  ),
                                  const SizedBox(height: 15.0),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.reasons,
                                        style: getFirstMediumStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Container(
                                        height: 150.0, // Adjust height if needed
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color:  ColorManager.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextField(
                                          maxLines: null,
                                          expands: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                            const EdgeInsets.all(12.0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
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
                        title: AppStrings.postponeStudtRequestpoUpTitle,
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
}



//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/drop_down_customized.dart';
// import 'package:mutahapplication/presentation/controllers/substitute_controller.dart';
// import 'package:mutahapplication/presentation/resources/assets_manager.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/routes_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mutahapplication/app/show_popup_function.dart';
//
// class PosponingStudiesRequestPage extends StatefulWidget {
//   @override
//   _PosponingStudiesRequestPage createState() => _PosponingStudiesRequestPage();
// }
//
// class _PosponingStudiesRequestPage extends State<PosponingStudiesRequestPage> {
//   final SubstituteRequestController controller = Get.put(
//       SubstituteRequestController());
//   String? selectedValue;
//   final List<String> items = ["19", "20", "21"];
//
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundWidget(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: ColorManager.transparentcolor,
//           appBar: const AppBarWidget(
//               title: AppStrings.postponingStudiesRequest),
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
//                                 AppStrings
//                                     .numbersOfSemestersNeededToPostpone,
//                                 style: getFirstMediumStyle(
//                                     color: ColorManager.black),
//                               ),
//                               const SizedBox(height: 20.0),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ReusableDropdownWidget(
//                                     items: items,
//                                     selectedValue: selectedValue,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedValue = value;
//                                       });
//                                     },
//                                     hintText: AppStrings
//                                         .numbersOfSemesters,
//                                   ),
//                                   const SizedBox(height: 20.0),
//                                      //here I need a title called (الأسباب) and a text box white under it in order to let the student write the reasons for postponing the studies
//
//                                 ],
//                               ),
//
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
//                       //here to send the data that student choose to do the request
//                       showPopup(
//                         context: context,
//                         title: AppStrings.increaseAcademicLoadRequestpoUpTitle,
//                         primaryButtonText: AppStrings
//                             .substituteRequestPopUpPrimaryButtonText,
//                         onPrimaryButtonPressed: () async {
//                           final Uri url = Uri.parse(
//                               'https://www.mutah.edu.jo/Home.aspx');
//                           if (await launchUrl(url)) {
//                             await launchUrl(
//                                 url, mode: LaunchMode.externalApplication);
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                   content: Text('Could not open the website.')),
//                             );
//                           }
//                         },
//                         secondaryButtonText: AppStrings
//                             .substituteRequestPopUpSecondaryButtonText,
//                         onSecondaryButtonPressed: () {
//                           Get.offNamed(Routes.mainRoute);
//                         },
//                       );
//                       // Call _showPopup on button press
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorManager.green,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40.0, vertical: 12.0),
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
//
// //
//
//
// }

