
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/data/services/logout_service.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart'; // For IconAssets
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import '../widgets/textfields/custome_text_fields_requests.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String? selectedValue;
  int _currentIndex = 0; // Keep track of the selected index

  // Handle navigation using the `CustomNavBar` logic
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Pass the logic to navigate based on the selected index
  }
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.myProfile),
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
                              Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Obx(() {
                                      // Determine the avatar image based on gender
                                      String avatarImage = userController.studentGender.value == 'F'
                                          ? ImageAssets.newAvatarFemale
                                          : ImageAssets.newAvatarMale;

                                      return SizedBox(
                                        width: 105,
                                        height: 105,
                                        child: Image.asset(
                                          avatarImage,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }),
                                    const SizedBox(height: 8),
                                    Obx(() {
                                      return Text(
                                        userController.studentId.value.isNotEmpty
                                            ? userController.studentId.value
                                            : 'No ID provided', // Fallback text
                                        style: getFirstSemiBoldStyle(color: ColorManager.black),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.name,
                                    style: getFirstMediumStyle(color: ColorManager.black),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Obx(() {
                                    return CustommTextField(
                                      readOnly: true,
                                      labelText: userController.studentName.value, // This will display the student name
                                      keyboardType: TextInputType.text,
                                    );
                                  }),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    AppStrings.email,
                                    style: getFirstMediumStyle(color: ColorManager.black),
                                  ),
                                  Obx(() {
                                    return CustommTextField(
                                      readOnly: true,
                                      labelText: userController.email.value.isNotEmpty
                                          ? userController.email.value
                                          : 'No email provided', // Fallback text
                                      keyboardType: TextInputType.text,
                                    );
                                  }),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    AppStrings.password,
                                    style: getFirstMediumStyle(color: ColorManager.black),
                                  ),
                                  const SizedBox(height: 8.0),
                                  CustommTextField(
                                    readOnly: true,
                                    obscureText: true,
                                    labelText: AppStrings.obsecuredText,
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 45),
                              // Logout button
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add logout logic here
                                    LogoutService.logout();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        IconAssets.logOut,
                                        color: ColorManager.white,
                                        width: 27,
                                        height: 27,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        AppStrings.logOut,
                                        style: getFirstMediumStyle(color: ColorManager.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: _currentIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/data/services/logout_service.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
// import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';
// import 'package:mutahapplication/presentation/resources/assets_manager.dart'; // For IconAssets
// import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
// import '../widgets/textfields/custome_text_fields_requests.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePage createState() => _ProfilePage();
// }
//
// class _ProfilePage extends State<ProfilePage> {
//   String? selectedValue;
//   int _currentIndex = 0; // Keep track of the selected index
//
//   // Handle navigation using the `CustomNavBar` logic
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     // Pass the logic to navigate based on the selected index
//   }
//   final UserController userController = Get.find();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundWidget(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: ColorManager.transparentcolor,
//           appBar: const AppBarWidget(title: AppStrings.myProfile),
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
//                               Center(
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(height: 8),
//                                     SizedBox(
//                                       width: 110,
//                                       height: 110,
//                                       child: Image.asset(
//                                         ImageAssets.avatarFemale,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Obx(() {
//                                       return Text(
//                                         userController.studentId.value.isNotEmpty
//                                             ? userController.studentId.value
//                                             : 'No ID provided', // Fallback text
//                                         style: getFirstSemiBoldStyle(color: ColorManager.black),
//                                       );
//                                     }),
//
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 18),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     AppStrings.name,
//                                     style: getFirstMediumStyle(color: ColorManager.black),
//                                   ),
//                                   const SizedBox(height: 8.0),
//                                   Obx(() {
//                                     return CustommTextField(
//                                       readOnly: true,
//                                       labelText: userController.studentName.value, // This will display the student name
//                                       keyboardType: TextInputType.text,
//                                     );
//                                   }),
//                                   const SizedBox(height: 8.0),
//                                   Text(
//                                     AppStrings.email,
//                                     style: getFirstMediumStyle(color: ColorManager.black),
//                                   ),
//                                   Obx(() {
//                                     return CustommTextField(
//
//                                       readOnly: true,
//                                       labelText: userController.email.value.isNotEmpty
//                                           ? userController.email.value
//                                           : 'No email provided', // Fallback text
//                                       keyboardType: TextInputType.text,
//                                     );
//                                   }),
//
//                                   const SizedBox(height: 8.0),
//                                   Text(
//                                     AppStrings.password,
//                                     style: getFirstMediumStyle(color: ColorManager.black),
//                                   ),
//                                   const SizedBox(height: 8.0),
//                                   CustommTextField(
//
//                                     readOnly: true,
//                                     obscureText: true,
//                                     labelText: AppStrings.obsecuredText,
//                                     keyboardType: TextInputType.visiblePassword,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 45),
//                               // Logout button
//                               Center(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Add logout logic here
//                                     LogoutService.logout();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: ColorManager.green,
//                                     padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         IconAssets.logOut,
//                                         color: ColorManager.white,
//                                         width: 27,
//                                         height: 27,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         AppStrings.logOut,
//                                         style: getFirstMediumStyle(color: ColorManager.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: CustomNavBar(
//             selectedIndex: _currentIndex,
//             onItemTapped: _onItemTapped,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
