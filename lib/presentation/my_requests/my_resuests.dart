import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/businessLogic/controllers/student_data_3_apis_controller.dart';
import 'package:mutahapplication/presentation/my_requests/customized_request_item_builder.dart';
import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the StudentDataController instance
    final StudentDataController studentDataController = Get.find<StudentDataController>();

    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.myRequests),
          body: Column(
            children: [
              const SizedBox(height: 24),
              Obx(() {
                // Dynamic rendering of services based on API responses
                List<Widget> services = [];


                // Show Postponing Studies Request if conditions are met
                if (!studentDataController.isFirstSemester.value &&
                    studentDataController.isEligibleToPostpone.value) {
                  services.add(const RequestItemWidget(
                    text: AppStrings.postponingStudiesRequest,
                    routeName: Routes.postponingStudiesRequest,
                  ));
                }

                // Show graduate-related services if pre-graduate and expected to graduate
                // if (studentDataController.isPreGraduate.value &&
                   if( studentDataController.isExpectedToGraduate.value) {
                  services.addAll([
                    const RequestItemWidget(
                      text: AppStrings.synchronizationCoursesRequest,
                      routeName: Routes.synchronizationCoursesRequest,
                    ),
                    const RequestItemWidget(
                      text: AppStrings.substituteCourseRequest,
                      routeName: Routes.substituteCourseRequest,
                    ),
                    const RequestItemWidget(
                      text: AppStrings.increasingAcademicLoadRequest,
                      routeName: Routes.increasingAcademicLoadRequest,
                    ),
                  ]);
                }
                // Show only Synchronization Courses Request if pre-graduate
                 if (studentDataController.isPreGraduate.value) {
                  services.add(const RequestItemWidget(
                    text: AppStrings.synchronizationCoursesRequest,
                    routeName: Routes.synchronizationCoursesRequest,
                  ));
                }

                // If there are no eligible services, display the message
                if (services.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: ColorManager.red,
                          size: 70, // Increased size for prominence
                        ),
                        const SizedBox(height: 20), // Increased spacing
                        Text(
                          AppStrings.noEligibleRequestsMessage,
                          textAlign: TextAlign.center,
                          style: getFirstSemiBoldStyle(color: ColorManager.red),
                        ),
                      ],
                    ),
                  );
                }

                // Display the list of services
                return ListView(
                  shrinkWrap: true,
                  children: services,
                );
              }),
            ],
          ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: 1,
            onItemTapped: (index) {
              NavigationHelper.navigateToPage(context, index);
            },
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/businessLogic/controllers/student_data_3_apis_controller.dart';
// import 'package:mutahapplication/presentation/my_requests/customized_request_item_builder.dart';
// import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/routes_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
// import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';
//
// class MyRequestsPage extends StatelessWidget {
//   const MyRequestsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the StudentDataController instance
//     final StudentDataController studentDataController = Get.find<StudentDataController>();
//
//     return BackgroundWidget(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           backgroundColor: ColorManager.transparentcolor,
//           appBar: const AppBarWidget(title: AppStrings.myRequests),
//           body: Column(
//             children: [
//               const SizedBox(height: 24),
//               Obx(() {
//                 // Dynamic rendering of services based on API responses
//                 List<Widget> services = [];
//
//                 // Check if the student is in their first semester
//                 if (!studentDataController.isFirstSemester.value) {
//                   // Add Postponing Studies Request if not in the first semester
//                   services.add(const RequestItemWidget(
//                     text: AppStrings.postponingStudiesRequest,
//                     routeName: Routes.postponingStudiesRequest,
//                   ));
//                 }
//
//                 // Check if the student is pre-graduate and graduate at the same time
//                 if (studentDataController.isPreGraduate.value && studentDataController.isExpectedToGraduate.value) {
//                   // Show all 3 services related to graduating
//                   services.addAll([
//                     const RequestItemWidget(
//                       text: AppStrings.synchronizationCoursesRequest,
//                       routeName: Routes.synchronizationCoursesRequest,
//                     ),
//                     const RequestItemWidget(
//                       text: AppStrings.substituteCourseRequest,
//                       routeName: Routes.substituteCourseRequest,
//                     ),
//                     const RequestItemWidget(
//                       text: AppStrings.increasingAcademicLoadRequest,
//                       routeName: Routes.increasingAcademicLoadRequest,
//                     ),
//                   ]);
//                 } else if (studentDataController.isPreGraduate.value) {
//                   // Only show Synchronization Courses Request for pre-graduate
//                   services.add(const RequestItemWidget(
//                     text: AppStrings.synchronizationCoursesRequest,
//                     routeName: Routes.synchronizationCoursesRequest,
//                   ));
//                 }
//
//                 // If there are no services, display the eligibility message
//                 if (services.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           Icons.info_outline,
//                           color: ColorManager.red,
//                           size: 70, // Increased size for prominence
//                         ),
//                         const SizedBox(height: 20), // Increased spacing
//                         Text(
//                           AppStrings.noEligibleRequestsMessage,
//                           textAlign: TextAlign.center,
//                           style: getFirstSemiBoldStyle(color: ColorManager.red),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//
//                 // Display the list of services
//                 return ListView(
//                   shrinkWrap: true,
//                   children: services,
//                 );
//               }),
//             ],
//           ),
//           bottomNavigationBar: CustomNavBar(
//             selectedIndex: 1,
//             onItemTapped: (index) {
//               NavigationHelper.navigateToPage(context, index);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
