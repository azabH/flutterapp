import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  factory HotelListData.fromJson(Map<String, dynamic> json) {
    return HotelListData(
        imagePath: json["imagePath"],
        titleTxt: json["titleTxt"],
        subTxt: json["subTxt"],
        dist: json["dist"],
        reviews: json["reviews"],
        rating: json["rating"],
        perNight: json["perNight"]);
  }

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;


  static List<HotelListData>  hotelList=[] ;

  static Future<List<HotelListData>> _getData() async {

    var res = await http.get(
        Uri.parse("https://www.sci-egypt.net/mainpage/home/test_api"));

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest ;
       List<HotelListData> hotelList = [];
      hotelList =
          rest.map<HotelListData>((json) => HotelListData.fromJson(json))
              .toList();
    }

    return hotelList;
  }

/*
  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
*/
}