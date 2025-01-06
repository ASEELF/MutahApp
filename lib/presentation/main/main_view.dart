import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/businessLogic/controllers/student_data_3_apis_controller.dart';
import 'package:mutahapplication/businessLogic/controllers/user_controller.dart';
import 'package:mutahapplication/data/services/api_3_requests_service.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/main/custom_drawer.dart';
import 'package:mutahapplication/presentation/models/grid_item_model.dart';
import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
import 'package:mutahapplication/presentation/resources/assets_manager.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/widgets/gridView_homePage/custom_grid_builder_widget.dart';
import 'package:mutahapplication/presentation/widgets/header_home_widget/header_widget.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_widget.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_bar_widget.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SearchTextController searchController = Get.put(SearchTextController());
  final GlobalKey<SearchBarWidgetState> searchWidgetKey = GlobalKey<SearchBarWidgetState>();
  final List<GridItem> items = [
    GridItem(title: AppStrings.myRequests, iconPath: IconAssets.myOrders),
    GridItem(title: AppStrings.schedule, iconPath: IconAssets.schedule),
    GridItem(title: AppStrings.academicPlan, iconPath: IconAssets.academicPlan),
    GridItem(title: AppStrings.hoursFees, iconPath: IconAssets.registrationFees),
    GridItem(title: AppStrings.marks, iconPath: IconAssets.marksRecord),
  ];

  int _currentIndex = 1;
  final UserController userController = Get.put(UserController());
  final StudentDataController studentDataController = Get.put(StudentDataController());
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Call the async method here
    _fetchStudentStatus();
  }

  // Create a separate async function to handle API calls
  Future<void> _fetchStudentStatus() async {
    // Fetch the student data first
     studentDataController.fetchStudentData();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the keyboard when tapping outside
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BackgroundWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorManager.transparentcolor,
            drawer: CustomDrawer(),
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Obx(() {
                      String username = userController.studentName.value.isEmpty
                          ? AppStrings.defaultUsername
                          : userController.studentName.value;
                      String formattedUsername = username.split(' ').take(4).join(' ');

                      return HeaderWidget(
                        username: formattedUsername,
                        scaffoldKey: _scaffoldKey,
                      );
                    }),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Display dynamic student status
                              Obx(() {
                                if (studentDataController.isExpectedToGraduate.value) {
                                  return Text('Student is expected to graduate');
                                } else if (studentDataController.isPreGraduate.value) {
                                  return Text('Student is pre-graduate');
                                } else if (studentDataController.isFirstSemester.value) {
                                  return Text('Student is in their first semester');
                                } else {
                                  return SizedBox(); // Hide when no condition is met
                                }
                              }),

                              CustomGridViewBuilder(
                                items: items,
                                searchController: searchController,
                                searchWidgetKey: searchWidgetKey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 180,
                  left: 18,
                  right: 18,
                  child: SearchWidget(
                    key: searchWidgetKey,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            bottomNavigationBar: CustomNavBar(
              selectedIndex: _currentIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    FocusManager.instance.primaryFocus?.unfocus();
    searchController.clearSearchText();
    NavigationHelper.navigateToPage(context, index);
  }
}
