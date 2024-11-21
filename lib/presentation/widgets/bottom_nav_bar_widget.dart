import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';


class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped ,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Handle item tap and navigate to the correct page
  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.profileRoute); // Navigate to Profile
        break;
      case 1:
        Navigator.pushNamed(context, Routes.mainRoute); // Navigate to Main (Home)
        break;
      case 2:
        Navigator.pushNamed(context, Routes.announcementsRoute); // Navigate to Announcements
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: widget.selectedIndex,
      height: 65.0,
      items: <Widget>[
        _buildNavItem(0, IconAssets.profileFilled, IconAssets.profileOutlined),
        _buildNavItem(1, IconAssets.homeFilled, IconAssets.homeOutlined),
        _buildNavItem(2, IconAssets.announcementsFilled, IconAssets.announcementsOutlined),
      ],
      color: ColorManager.white,
      buttonBackgroundColor: ColorManager.white, // Background color for the selected button
      backgroundColor: ColorManager.lightgrey,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: onItemTapped, // Pass the onItemTapped function here
      letIndexChange: (index) => true,
    );
  }

  // Helper method to style icons based on their selection state
  Widget _buildNavItem(int index, String filledIconPath, String outlinedIconPath) {
    bool isSelected = widget.selectedIndex == index;
    return Image.asset(
      isSelected ? filledIconPath : outlinedIconPath,
      width: 35,
      height: 35,
      color: isSelected ? ColorManager.green : ColorManager.darkGrey,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:mutahapplication/presentation/resources/assets_manager.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
//
// class CustomNavBar extends StatefulWidget {
//   final Function(int) onItemTapped;
//   final int selectedIndex;
//
//   const CustomNavBar({
//     Key? key,
//     required this.onItemTapped,
//     required this.selectedIndex,
//   }) : super(key: key);
//
//   @override
//   State<CustomNavBar> createState() => _CustomNavBarState();
// }
//
// class _CustomNavBarState extends State<CustomNavBar> {
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavigationBar(
//       key: _bottomNavigationKey,
//       index: widget.selectedIndex,
//       height: 65.0,
//       items: <Widget>[
//         _buildNavItem(0, IconAssets.profileFilled, IconAssets.profileOutlined),
//         _buildNavItem(1, IconAssets.homeFilled, IconAssets.homeOutlined),
//         _buildNavItem(2, IconAssets.announcementsFilled, IconAssets.announcementsOutlined),
//
//       ],
//       color: ColorManager.white,
//       buttonBackgroundColor: ColorManager.white, // Background color for the selected button
//       backgroundColor: ColorManager.lightgrey,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 600),
//       onTap: widget.onItemTapped,
//       letIndexChange: (index) => true,
//     );
//   }
//
//   // Helper method to style icons based on their selection state
//   Widget _buildNavItem(int index, String filledIconPath, String outlinedIconPath) {
//     bool isSelected = widget.selectedIndex == index;
//     return Image.asset(
//       isSelected ? filledIconPath : outlinedIconPath,
//       width: 35,
//       height: 35,
//       color: isSelected ? ColorManager.green : ColorManager.darkGrey,
//     );
//   }
// }
//
//
//
//
//
