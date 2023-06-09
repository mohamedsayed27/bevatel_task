import 'package:untitled/core/assets_path/images_path.dart';
import 'package:untitled/core/assets_path/svg_path.dart';

class HomeDummyData{
  static List<Map< String, dynamic>> categoriesDummyList = [
    {
      "icon": SvgPath.flashLight,
      "title":"Flash deal",
    },
    {
      "icon": SvgPath.bill,
      "title":"Bill",
    },
    {
      "icon": SvgPath.discord,
      "title":"Game",
    },
    {
      "icon": SvgPath.gift,
      "title":"Daily gift",
    },
    {
      "icon": SvgPath.compass,
      "title":"More",
    },
  ];

  static List<Map<String, dynamic>> productList = [
    {
      "image":ImagesPath.h1,
      "title":"Wireless Headphones",
      "details":"Wireless Headphones ,"*10,
      "imagesList":[
        ImagesPath.h1,
        ImagesPath.h2,
        ImagesPath.h3,
      ],
    },
    {
      "image":ImagesPath.p1,
      "title":"Wireless controller for PS",
      "details":"Wireless controller for PS ,"*10,
      "imagesList":[
        ImagesPath.p1,
        ImagesPath.p2,
        ImagesPath.p3,
        ImagesPath.p4,
      ],
    },
    {
      "image":ImagesPath.t1,
      "title":"Amazing TV Screen",
      "details":"Amazing TV Screen ,"*10,
      "imagesList":[
        ImagesPath.t1,
        ImagesPath.t2,
        ImagesPath.t3,
      ],
    },
  ];
}