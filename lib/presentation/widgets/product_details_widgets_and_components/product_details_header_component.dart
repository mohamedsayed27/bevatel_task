import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation/widgets/product_details_widgets_and_components/product_images_alboum_widget.dart';

import '../../../core/theme/app_colors.dart';
import 'back_button_and_rating_widget.dart';

class ProductDetailsHeaderComponent extends StatelessWidget {
  final String image;
  final double rate;
  const ProductDetailsHeaderComponent({Key? key, required this.image, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.whitColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
           BackButtonAndRatingWidget(rate: rate,),
          SizedBox(height: 10.h,),
          ProductImagesAlbumWidget(image: image,),
        ],
      ),
    );
  }
}
