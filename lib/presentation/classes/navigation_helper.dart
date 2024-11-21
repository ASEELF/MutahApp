import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';


//// This function handles navigation based on the index selected
class NavigationHelper {
  static void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.profileRoute); // Profile page
        break;
      case 1:
        Navigator.pushNamed(context, Routes.mainRoute); // Home/Main page
        break;
      case 2:
        Navigator.pushNamed(context, Routes.announcementsRoute); // Announcements page
        break;
      default:
        break;
    }
  }
}
