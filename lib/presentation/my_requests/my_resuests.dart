import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/my_requests/customized_request_item_builder.dart';
import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.myRequests),
          body: const Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    RequestItemWidget(
                      text: AppStrings.substituteCourseRequest,
                      routeName: Routes.substituteCourseRequest,
                    ),
                    RequestItemWidget(
                      text: AppStrings.increasingAcademicLoadRequest,
                      routeName: Routes.increasingAcademicLoadRequest,
                    ),
                    RequestItemWidget(
                      text: AppStrings.postponingStudiesRequest,
                      routeName: Routes.postponingStudiesRequest,
                    ),
                    RequestItemWidget(
                      text: AppStrings.synchronizationCoursesRequest,
                      routeName: Routes.synchronizationCoursesRequest,
                    ),
                  ],
                ),
              ),
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
