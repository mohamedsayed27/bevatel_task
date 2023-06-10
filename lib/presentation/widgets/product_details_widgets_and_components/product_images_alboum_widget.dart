import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductImagesAlbumWidget extends StatefulWidget {
  final String image;

  const ProductImagesAlbumWidget({Key? key, required this.image})
      : super(key: key);

  @override
  State<ProductImagesAlbumWidget> createState() => _ProductImagesAlbumWidgetState();
}

class _ProductImagesAlbumWidgetState extends State<ProductImagesAlbumWidget> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          width:  200.w,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r)
          ),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: widget.image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
        // SizedBox(height: 10.h,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(
        //     widget.imagesList.length,
        //     (index) => ImageItemWidget(
        //       image: widget.imagesList[index],
        //       index: index,
        //       currentIndex: currentIndex,onTap: (){
        //         setState(() {
        //           currentIndex = index;
        //         });
        //     }
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
