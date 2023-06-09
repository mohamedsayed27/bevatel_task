import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/assets_path/fonts_path.dart';
import 'package:untitled/core/theme/app_colors.dart';

import '../../core/dummy_data/home_dummy_data.dart';
import '../widgets/home_screen_widgets_and_components/banner_component.dart';
import '../widgets/home_screen_widgets_and_components/categories_component.dart';
import '../widgets/home_screen_widgets_and_components/categories_element_widget.dart';
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
          HeaderComponent(),
          BannerComponent(),
          CategoriesComponent(),
          SpecialForYouComponent(),
          PopularProductComponent(),
        ],
      ),
    );
  }
}
