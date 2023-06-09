import '../assets_path/images_path.dart';

class CartDummyData{
  static List<Map<String, dynamic>> cartList = [
    {
      "title": "Wano Store",
      "items": [
        {
          "productTitle": "Wireless player",
          "productImage": ImagesPath.p1,
          "price": 250,
          "count": 2
        },
        {
          "productTitle": "Smart TV",
          "productImage": ImagesPath.t1,
          "price": 100,
          "count": 1
        }
      ]
    },
    {
      "title": "Wano Store2",
      "items": [
        {
          "productTitle": "Wireless player2",
          "productImage": ImagesPath.p2,
          "price": 250,
          "count": 2
        },
        {
          "productTitle": "Smart TV2",
          "productImage": ImagesPath.t2,
          "price": 100,
          "count": 1
        }
      ]
    },{
      "title": "Wano Store3",
      "items": [
        {
          "productTitle": "Wireless player3",
          "productImage": ImagesPath.p3,
          "price": 250,
          "count": 2
        },
        {
          "productTitle": "Smart TV3",
          "productImage": ImagesPath.t3,
          "price": 100,
          "count": 1
        }
      ]
    },
  ];
}