import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final SearchTextController searchController = Get.find<SearchTextController>();

  // Handle item tap and navigate to the correct page
  void onItemTapped(int index) {
    if (index == widget.selectedIndex) return;

    setState(() {
      widget.onItemTapped(index);
    });

    switch (index) {
      case 0:
        Get.toNamed(Routes.profileRoute)?.then((_) {

          setState(() {
            widget.onItemTapped(1);
            searchController.clearSearchText();

          });
        });
        break;
      case 1:
        Get.toNamed(Routes.mainRoute)?.then((_) {
          searchController.clearSearchText();

        });
        // Get.toNamed(Routes.mainRoute);
        break;
      case 2:

        Get.toNamed(Routes.announcementsRoute)?.then((_) {
          setState(() {
            widget.onItemTapped(1);
            searchController.clearSearchText();

          });
        // Get.toNamed(Routes.announcementsRoute)?.then((_) {
        //   setState(() {
        //     widget.onItemTapped(1);
        //   });
        });
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
      onTap: onItemTapped,
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




