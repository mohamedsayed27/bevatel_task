import 'package:flutter/material.dart';

import '../widgets/home_screen_widgets_and_components/banner_component.dart';
import '../widgets/home_screen_widgets_and_components/categories_component.dart';
import '../widgets/home_screen_widgets_and_components/header_component.dart';
import '../widgets/home_screen_widgets_and_components/popular_product_component.dart';
import '../widgets/home_screen_widgets_and_components/special_for_you_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          SearchBarAndCartAndNotificationComponent(),
          BannerComponent(),
          CategoriesComponent(),
          SpecialForYouComponent(),
          PopularProductComponent(),
        ],
      ),
    );
  }
}
