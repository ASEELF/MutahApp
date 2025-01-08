import 'package:flutter/material.dart';
import 'package:mutahapplication/data/models/announcement_model.dart';
import 'package:mutahapplication/presentation/widgets/announcements_widgets/announcement_item_widget.dart';
import 'package:mutahapplication/presentation/widgets/announcements_widgets/category_button_widget.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';

import '../../data/services/api_service_announcement.dart';


class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  int _currentIndex = 2;
  String _selectedCategory = "الإعلانات المالية";

  List<Announcement> _announcements = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchAnnouncements(_selectedCategory);
  }

  void _fetchAnnouncements(String category) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetching data using the controller
      final announcements = await _apiService.fetchAnnouncements(category);
      setState(() {
        _announcements = announcements;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching announcements: $e");
    }
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _fetchAnnouncements(category);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BackgroundWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager.transparentcolor,
            appBar: const AppBarWidget(title: AppStrings.announcements),
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.lightgrey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryButtonWidget(
                            title: "إعلانات القبول والتسجيل",
                            selectedCategory: _selectedCategory,
                            onCategorySelected: _onCategorySelected,
                          ),
                          CategoryButtonWidget(
                            title: "الإعلانات المالية",
                            selectedCategory: _selectedCategory,
                            onCategorySelected: _onCategorySelected,
                          ),
                        ],
                      ),
                    ),
                    // Announcements List
                    Expanded(
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: _announcements
                                .map((announcement) => AnnouncementItemWidget(
                              text: announcement.title,
                              content: announcement.body,
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
}

// import 'package:flutter/material.dart';
// import 'package:mutahapplication/presentation/widgets/announcements_widgets/announcement_item_widget.dart';
// import 'package:mutahapplication/presentation/widgets/announcements_widgets/category_button_widget.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/presentation/widgets/navigation%20bar/bottom_nav_bar_widget.dart';
//
// class AnnouncementsPage extends StatefulWidget {
//   const AnnouncementsPage({Key? key}) : super(key: key);
//
//   @override
//   _AnnouncementsPageState createState() => _AnnouncementsPageState();
// }
//
// class _AnnouncementsPageState extends State<AnnouncementsPage> {
//   int _currentIndex = 1;
//   String _selectedCategory = "الإعلانات المالية";
//
//   final Map<String, List<String>> _announcementsByCategory = {
//     "إعلانات القبول والتسجيل": ["إعلان قبول وتسجيل 1", "إعلان قبول وتسجيل 2"],
//     "الإعلانات المالية": ["إعلان مالي 1", "إعلان مالي 2"],
//   };
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: BackgroundWidget(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//             backgroundColor: ColorManager.transparentcolor,
//             appBar: const AppBarWidget(title: AppStrings.announcements),
//             body: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: BoxDecoration(
//                         color: ColorManager.white,
//                         borderRadius: BorderRadius.circular(12.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: ColorManager.lightgrey,
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: _announcementsByCategory.keys
//                             .map((category) => CategoryButtonWidget(
//                           title: category,
//                           selectedCategory: _selectedCategory,
//                           onCategorySelected: (category) {
//                             setState(() {
//                               _selectedCategory = category;
//                             });
//                           },
//                         ))
//                             .toList(),
//                       ),
//                     ),
//                     // Announcements List
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: _announcementsByCategory[_selectedCategory]!
//                                 .map((announcement) => AnnouncementItemWidget(text: announcement))
//                                 .toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             bottomNavigationBar: CustomNavBar(
//               selectedIndex: _currentIndex,
//               onItemTapped: _onItemTapped,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
