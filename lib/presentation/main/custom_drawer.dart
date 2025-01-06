import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/data/services/logout_service.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';

class CustomDrawer extends StatelessWidget {
  final UserController userController = Get.find(); // Fetch the controller

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Obx(() {
            String fullName = userController.studentName.value;
            print("Student Name: $fullName");

            // Format the name to include only the first two words
            String formattedUsername = fullName.isNotEmpty
                ? fullName.split(' ').take(2).join(' ')
                : 'No Name Provided';
            print("Formatted Username: $formattedUsername");

            // Determine the avatar image based on gender
            String avatarImage = userController.studentGender.value == 'F'
                ? ImageAssets.newAvatarFemale
                : ImageAssets.newAvatarMale;

            return DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      avatarImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formattedUsername,

                        // userController.studentName.value.isNotEmpty
                        //     ? userController.studentName.value
                        //     : 'No Name Provided', // Fallback
                        style: getFirstMediumStyle(color: ColorManager.black),
                      ),
                      Text(
                        userController.studentId.value.isNotEmpty
                            ? userController.studentId.value
                            : 'No ID Provided', // Fallback
                        style: getFirstMediumStyle(color: ColorManager.black),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          // Drawer Items
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(
              'الملاحظات',
              style: getFirstRegularStyle(color: ColorManager.black),
            ),
            onTap: () {
              // Handle Notes Tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: Text(
              'المظهر',
              style: getFirstRegularStyle(color: ColorManager.black),
            ),
            onTap: () {
              // Handle Appearance Tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: Text(
              'تواصل معنا',
              style: getFirstRegularStyle(color: ColorManager.black),
            ),
            onTap: () {
              Get.toNamed(Routes.contactUsPage);
            },
          ),
          const Spacer(),
          // Updated Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logout logic here
                LogoutService.logout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.green,
                padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
// import 'package:mutahapplication/data/services/logout_service.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:mutahapplication/presentation/resources/assets_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
//
// class CustomDrawer extends StatelessWidget {
//   final UserController userController = Get.find(); // Fetch the controller
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Obx(() {
//             return DrawerHeader(
//               decoration: BoxDecoration(color: Colors.grey.shade300),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 80,
//                     height: 80,
//                     child: Image.asset(
//                       ImageAssets.avatarFemale,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         userController.studentName.value.isNotEmpty
//                             ? userController.studentName.value
//                             : 'No Name Provided', // Fallback
//                         style: getFirstMediumStyle(color: ColorManager.black),
//                       ),
//                       Text(
//                         userController.studentId.value.isNotEmpty
//                             ? userController.studentId.value
//                             : 'No ID Provided', // Fallback
//                         style: getFirstMediumStyle(color: ColorManager.black),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }),
//           // Drawer Items
//           ListTile(
//             leading: Icon(Icons.info_outline),
//             title: Text('الملاحظات' , style: getFirstRegularStyle(color: ColorManager.black),),
//             onTap: () {
//               // Handle Notes Tap
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.color_lens_outlined),
//             title: Text('المظهر' ,  style: getFirstRegularStyle(color: ColorManager.black)),
//             onTap: () {
//               // Handle Appearance Tap
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.phone_outlined),
//             title: Text('تواصل معنا' , style: getFirstRegularStyle(color: ColorManager.black),),
//             onTap: () {
//               // Handle Contact Us Tap
//             },
//           ),
//           Spacer(),
//           // Updated Logout Button
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Add logout logic here
//                 LogoutService.logout();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: ColorManager.green,
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     IconAssets.logOut,
//                     color: ColorManager.white,
//                     width: 27,
//                     height: 27,
//                   ),
//                   const SizedBox(width: 10),
//                   Text(
//                     AppStrings.logOut,
//                     style: getFirstMediumStyle(color: ColorManager.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//         ],
//       ),
//     );
//   }
// }
//
//
