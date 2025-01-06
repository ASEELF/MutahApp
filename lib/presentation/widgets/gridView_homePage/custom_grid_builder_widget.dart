import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/controllers/search_controller.dart';
import 'package:mutahapplication/presentation/models/grid_item_model.dart';
import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/widgets/gridView_homePage/grid_item_widget.dart';
import 'package:mutahapplication/presentation/widgets/search_bar/search_bar_widget.dart';
class CustomGridViewBuilder extends StatelessWidget {
  final List<GridItem> items;
  final SearchTextController searchController;
  final GlobalKey<SearchBarWidgetState> searchWidgetKey;

  const CustomGridViewBuilder({
    Key? key,
    required this.items,
    required this.searchController,
    required this.searchWidgetKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final route = NavigationRoutes.routes[item.title];

        return GestureDetector(
          onTap: () async {
            searchController.updateSearchText('');
            searchController.clearSearchText();
            searchWidgetKey.currentState?.clearTextField();
            FocusManager.instance.primaryFocus?.unfocus();

              // Navigate based on your logic
              if (route != null) {
                print('Navigating to: $route for item: ${item.title}');
                Get.toNamed(route)?.then((_) {
                  searchController.clearSearchText();
                });
              } else {
                print('No route defined for: ${item.title}');
              }

          },
          child: GridItemWidget(
            title: item.title,
            iconPath: item.iconPath,
            backgroundColor: ColorManager.white,
          ),
        );
      },
    );
  }
}



