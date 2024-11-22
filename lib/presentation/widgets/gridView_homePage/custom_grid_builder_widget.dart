import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/presentation/models/grid_item_model.dart';
import 'package:mutahapplication/presentation/navigation_helper/navigation_helper.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/widgets/gridView_homePage/grid_item_widget.dart';


class CustomGridViewBuilder extends StatelessWidget {
  final List<GridItem> items;

  const CustomGridViewBuilder({
    Key? key,
    required this.items,
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
          onTap: () {
            if (route != null) {
              print('Navigating to: $route for item: ${item.title}');
              Get.toNamed(route);
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

