
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';


//// This function handles navigation based on the index selected
class NavigationHelper {
  static void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.profileRoute);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.mainRoute);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.announcementsRoute);
        break;
      default:
        break;
    }
  }
}

class NavigationRoutes {
  static Map<String, String> get routes => {
    AppStrings.myRequests: Routes.myRequestsRoute,
    AppStrings.schedule: Routes.schedule,
    AppStrings.academicPlan: Routes.academicPlan,
    AppStrings.hoursFees: Routes.hoursFees,
    AppStrings.marks: Routes.marks,
  };
}
class NavigationService {
  // A centralized method for navigation
  static void navigateTo(String routeName) {
    String? route = NavigationRoutes.routes[routeName];

    if (route != null) {
      print('Navigating to: $route');
      Get.toNamed(route);

    } else {
      print('No route found for: $routeName');
    }
  }
}
