import 'package:get/get.dart';

class SearchTextController extends GetxController {
  var searchText = ''.obs;
  var filteredCourses = <String>[].obs;
  List<String> allServices = [
    'طلباتي',
    'البرنامج الدراسي',
    'الخطة الأكاديمية',
    'رسوم الساعات',
    'سجل العلامات',
  ];
  // update search query and filter results
  void updateSearchText(String value) {
    searchText.value = value;
    filterCourses();
  }

  // filter courses based on the search query
  void filterCourses() {
    if (searchText.value.isEmpty) {
      filteredCourses.value = [];
    } else {
      filteredCourses.value = allServices
          .where((course) => course.toLowerCase().contains(searchText.value.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    filteredCourses.value = [];
  }
}

