import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/classes/navigation_helper.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/models/grid_item_model.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/custom_grid_builder_widget.dart';
import 'package:mutahapplication/presentation/widgets/header_widget.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_result_widget.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<GridItem> items = [
    GridItem(title: 'طلباتي', iconPath: IconAssets.myOrders),
    GridItem(title: 'البرنامج الدراسي', iconPath: IconAssets.schedule),
    GridItem(title: 'الخطة الأكاديمية', iconPath: IconAssets.academicPlan),
    GridItem(title: 'رسوم الساعات', iconPath: IconAssets.registrationFees),
    GridItem(title: 'سجل العلامات', iconPath: IconAssets.marksRecord),
  ];
  final SearchTextController searchController = Get.put(SearchTextController());
  int _currentIndex = 1;
  // Using NavigationHelper to navigate based on the selected index
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Call the helper function to navigate to the corresponding page
    NavigationHelper.navigateToPage(context, index);
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.transparentcolor,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  const Stack(
                    clipBehavior: Clip.none,
                    children: [
                      HeaderWidget(username: 'أسيل عامر فراج'),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Grid Items
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: SingleChildScrollView(
                        child: CustomGridViewBuilder(items: items),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 157,
                left: 18,
                right: 18,
                child: SearchWidget(),
              ),
            ],
          ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: _currentIndex,
            onItemTapped: (index) {
              setState(() {
                _currentIndex = index; // Update the selected index
              });

              // Use the NavigationHelper to handle navigation
              NavigationHelper.navigateToPage(context, index);
            },
          ),
        ),
      ),
    );
  }

}