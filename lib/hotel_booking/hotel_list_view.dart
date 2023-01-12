import 'package:best_flutter_ui_templates/hotel_booking/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'model/hotel_list_data.dart';

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
}
class HotelListView extends StatelessWidget {
   HotelListView(
      {Key? key,
      this.hotelData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  late   HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  @override
  void initState(){
    _getData();
  }
   void _getData() async {

    var res = await http.get(
        Uri.parse("https://www.sci-egypt.net/mainpage/home/test_api"));

    if (res.statusCode == 200) {
      print("sucess");
      var data = json.decode(res.body);
      var rest ;

      hotelData =
          rest.map<HotelListData>((json) => HotelListData.fromJson(json))
              .toList();
    }
    else
      {
        print("faild");
      }


  }
  @override
  Widget build(BuildContext context) {

    void goBack() {
      Navigator.pop(context, true);
    }
    // TODO: implement build
    return
      WillPopScope(
          onWillPop: () async {
            goBack();
            return true;
          },

          child:Scaffold(appBar: AppBar(title:Text(""),actions:[ IconButton(icon: Icon(Icons.add), onPressed: (){

           // Navigator.push(context,
              ///  new MaterialPageRoute(builder: (context) => Addmbnzen())
            //);

          })
          ],),
            body: Container(
              height: MediaQuery.of(context).size.height - 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(75))),
              child:FutureBuilder(future:_getUsers(),builder: (BuildContext context,AsyncSnapshot asyncSnapshot){
                if(asyncSnapshot.data==null)
                {
                  return Container(child: Center(child: Text("Loading..."),),);
                }
                else {
                  return ListView.builder(itemCount: asyncSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(asyncSnapshot.data[index].pay+" L.E"),
                            leading: CircleAvatar(backgroundImage: NetworkImage((asyncSnapshot.data[index].image.toString())),),
                            subtitle: Text(asyncSnapshot.data[index].date  ,style: TextStyle(backgroundColor: Colors.redAccent[400],color: Colors.white)) ,
                            trailing:        GestureDetector(
                              child: Icon(Icons.delete, color: Colors.grey,),
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => DetailPage(asyncSnapshot.data[index]))  );
                              },
                            ),
                            onTap: () {


                            }
                        );
                      });
                }
              },),
            ),));
  }

   Future<List<User>> _getUsers() async {
     var data = await http.get(Uri.parse("https://www.sci-egypt.net/mainpage/home/get_zobba_bnzen"));
     var jsonData = json.decode(data.body);

     List<User> users= [];
     for(var u in jsonData) {
       User user = User(u["id"],u["name"], u["pay"], u["date"], u["image"]);

       users.add(user);
     }

     print("the count is " + users.length.toString());

     return users;
   }








}
class User {
  final String id;
  final String name;

  final String pay;
  final String date;

  final String image;


  User(this.id, this.name, this.pay, this.date, this.image  );
}

class DetailPage extends StatelessWidget {

  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(backgroundImage: NetworkImage((user.image.toString()))),
              Text( user.pay.toString()+"هل أنت متأكد من الحذف "),
              SizedBox(
                width: 200,
                height: 50,


              )

            ],
          ),
        ),
      ),
    );
  }

  void _delete_distance(String id) {}
}