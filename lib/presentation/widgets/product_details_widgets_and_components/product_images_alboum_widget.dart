import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import 'image_item_widget.dart';

class ProductImagesAlbumWidget extends StatefulWidget {
  final List<String> imagesList;

  const ProductImagesAlbumWidget({Key? key, required this.imagesList})
      : super(key: key);

  @override
  State<ProductImagesAlbumWidget> createState() => _ProductImagesAlbumWidgetState();
}

class _ProductImagesAlbumWidgetState extends State<ProductImagesAlbumWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.imagesList[currentIndex],
          width: 200.w,
          height: 200.h,
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagesList.length,
            (index) => ImageItemWidget(
              image: widget.imagesList[index],
              index: index,
              currentIndex: currentIndex,onTap: (){
                setState(() {
                  currentIndex = index;
                });
            }
            ),
          ),
        ),
      ],
    );
  }
}
