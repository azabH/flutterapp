import 'package:best_flutter_ui_templates/contactus.dart';
import 'package:best_flutter_ui_templates/modules/createpolicy.dart';
import 'package:best_flutter_ui_templates/modules/createpolicy2.dart';
import 'package:best_flutter_ui_templates/modules/priceme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:best_flutter_ui_templates/data.dart';
import 'package:best_flutter_ui_templates/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'events_and_experiences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'modules/signinpage.dart';
import 'modules/signup.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }

}

class _Home extends State<Home>
{

  @override
  void initState() {
  _loadCounter();
}

bool _isLog=false;
String fullname="";
String MobileNo="";
String Email="";

  @override
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('isLog') != null)
      {

        setState(() {
          _isLog=prefs.getBool('isLog')!;
        });
      }

    if(prefs.getString('fullname') != null)
    {
      setState(() {
        fullname=prefs.getString('fullname')!;
      });

    }

    if(prefs.getString('MobileNo') != null)
    {
      setState(() {
        MobileNo=prefs.getString('MobileNo')!;
      });

    }

    if(prefs.getString('Email') != null)
    {
      setState(() {
        fullname=prefs.getString('Email')!;
      });

    }
  }
  List<Category> _list = FakeData().categoriesList;
  List<Category> _list2 = FakeData().categoriesList2;
  int selectedCard = -1;
  Widget _buildChild() {
    if (_isLog==false) {
      return AnimationLimiter(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4),
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _list2.length,

              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {

                      // ontap of each card, set the defined int to the grid view index
                      selectedCard = index;

                      if(selectedCard==0)
                      {

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }
                      else if(selectedCard==1)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignUp()))   ;
                      }
                    },
                    child:  AnimationConfiguration.staggeredGrid(

                        columnCount: 2,
                        position: index,
                        duration: Duration(milliseconds: 20),
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                delay: Duration(milliseconds: 20),
                                child: listItem2(_list2[index])))));
              }));
  }
    else {
      return Column(children: [
        SizedBox(height:20),
        Row(children: [

          Text("مرحبا ", style: TextStyle(color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
          Text(fullname, style: TextStyle(color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20),)
        ],)
      ],);
    }
  }
    // TODO: implement build
    @override
    void doUserLogout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('fullname');
      prefs.remove('username');
      prefs.remove('uid');

      /*
    prefs.setString('fullname', fullname);
    prefs.setString('uid', uid);
    prefs.setString('username', username);

     */
      prefs.setBool('isLog', false);

    }
    Widget build(BuildContext context) {

      int _index = 0;
      void _onItemTapped(int index) {
        setState(() {
          _index = index;
        });

        if(_index==0) {

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()));
        }
        else if(_index==2) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => contactus()));
        }
       else if(_index==3)
        {
          _isLog==false?
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SignIn()))
            :
          doUserLogout();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Home()))

          ;
        }
      }
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return Scaffold(
appBar: null,
          drawer: Drawer(),
/*
          appBar: AppBar(

            backgroundColor: Colors.blue.shade400,

            toolbarHeight: 100,

            elevation: 14,

            shape: RoundedRectangleBorder(

                borderRadius:

                BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70))

            ),

            title: Image.asset('assets/images/logo.png', fit: BoxFit.fill),


            actions: [

              Row(

                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                  )
/*
                  Container(

                    height: 40,width: 40,

                    alignment: Alignment.center,

                    decoration: BoxDecoration(

                        boxShadow: [

                          BoxShadow(blurRadius: 7,spreadRadius: 3,

                              color: Colors.blue

                          )

                        ],

                        shape: BoxShape.circle,

                        color: Colors.blue.shade400

                    ),

                    child: Icon(Icons.search,size: 20,

                    ),

                  ),

                  SizedBox(width: 10,),

                  Container(

                    height: 40,width: 40,

                    alignment: Alignment.center,

                    decoration: BoxDecoration(

                        boxShadow: [

                          BoxShadow(blurRadius: 7,spreadRadius: 3,

                              color: Colors.blue

                          )

                        ],

                        shape: BoxShape.circle,

                        color: Colors.blue.shade400

                    ),

                    child: Icon(Icons.notifications,size: 20,

                    ),

                  ),

                  SizedBox(width: 10,),  Container(

                    height: 40,width: 40,

                    alignment: Alignment.center,

                    decoration: BoxDecoration(

                        boxShadow: [

                          BoxShadow(blurRadius: 7,spreadRadius: 3,

                              color: Colors.blue

                          )

                        ],

                        shape: BoxShape.circle,

                        color: Colors.blue.shade400

                    ),

                    child: Icon(Icons.logout,size: 20,

                    ),

                  ),

                  SizedBox(width: 26,)
*/
                ],

              )

            ],

          )
*/
       bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF598BED),
        showUnselectedLabels: true,

        unselectedItemColor: const Color(0xFF6D747A),
        onTap: _onItemTapped,
        items:   [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined,),
            label: 'طلب جديد',
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: 'إتصل بنا',
          ),
           _isLog==false?
          BottomNavigationBarItem(
            icon:   Icon(Icons.person_pin),
            label: 'تسجيل الدخول',

          )
            :
        BottomNavigationBarItem(
          icon:   Icon(Icons.logout,color:Colors.blue),
          label: 'خـروج',

        )


        ],

      ),
          body:SingleChildScrollView(
              child: Container(

                child:  Column(children: [
      Stack(

      clipBehavior: Clip.none, alignment: Alignment.bottomCenter,
      children: <Widget>[
      Row(
      children: <Widget>[
      Expanded(
      child: Container(
      height: 220.0,
      decoration: BoxDecoration(
      image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
      'https://www.sci-egypt.net/newsite/Newsuez/images/bg/banner1.jpg'))),
      ),
      )
      ],
      ),
      Positioned(
      top: 30.0,
      child: Container(
      width: width,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
      children: [
      IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: (){}),
      Text('القائمة الرئيسية',style: TextStyle(color: Colors.white,fontSize: 22),),
      ],
      ),
      IconButton(icon: Icon(Icons.notifications,color: Colors.white,), onPressed: (){}),
      ],
      ),
      height: 52,
      ),
      ),
      Positioned(
      top: 180.0,
      child: Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
      'https://sci-broker.com/flutterlogo.png'),
      ),
      border:
      Border.all(color: Colors.white, width: 6.0)),
      ),
      ),





      ],
      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),

                    child:_buildChild()


                  ),


                  CarouselSlider(
                    items: [

                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage("https://www.sci-egypt.net/newsite/Newsuez/images/bg/banner1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage("https://www.sci-egypt.net/newsite/Newsuez/images/bg/header2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage("https://www.sci-egypt.net/newsite/Newsuez/images/service/service_car_old.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 150.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  )
                  ,
                  SizedBox(height: 5,),
                  ProgramsBar(
                      title: 'خدماتنا'
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 20,left: 20),
                      width: 450,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          boxShadow: [BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10
                          )],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column( children: [
                        Row(children: [


InkWell(child:     datagrid(title: 'طلب تأمين علي سيارة مرخصة  ',image:'assets/images/item1.png' )
,onTap: () {
    Navigator.push(


        context,
        MaterialPageRoute(builder: (context) => createpolicy2()));
},)

                      ,

   InkWell(child: datagrid(title: 'تسعير السيارة',image:'assets/images/item3.png' )
            ,onTap: () {
       Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => Priceme()));
          },)
                        ],),


                        Row(children: [

         InkWell(child: datagrid(title: 'إصدار وثيقة الكترونية لسيارة زيرو',image:'assets/images/item2.png' ),
                  onTap: () {
      if (_isLog==false) {
        showAlertDialogSucess(context);
      }
      else
      {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => createpolicy()));
      }
          },),
        InkWell(child: datagrid(title: 'إتصل بنا',image:'assets/images/item4.png' )
        ,onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => contactus()));
      },)
                        ],),
                      ],)),
                  ProgramsBar(
                      title: 'أخبار الشركة'
                  ),
                  SizedBox(height: 5,),
                  EventsAndExperiences(),


/*
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: AnimationLimiter(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {

                                    // ontap of each card, set the defined int to the grid view index
                                    selectedCard = index;

                                    if(index==2)
                                    {
                                      print(index);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Priceme()));
                                    }
                                   else if(index==3)
                                    {
                                      print(index);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => contactus()));
                                    }

                                  },
                                  child:  AnimationConfiguration.staggeredGrid(
                                      columnCount: 2,
                                      position: index,
                                      duration: Duration(milliseconds: 1000),
                                      child: ScaleAnimation(
                                          child: FadeInAnimation(
                                              delay: Duration(milliseconds: 100),
                                              child: listItem(_list[index])))));
                            })),
                  ),

                  */

                  SizedBox(height: 5,),



                ]),
              )) );
    }
    Widget listItem2(Category category) {

      return   Padding( //outer spacing
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Wrap(
            spacing: 2, // space between items
            children: [Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 50,
                  padding: EdgeInsets.all(2),
                  child: Image.asset(category.image),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  category.name,
                  style: TextStyle(fontSize: 14, fontFamily: 'Heavy',),
                )
              ],
            )],
          )

      );
    }
    Widget listItem(Category category) {
      return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(8),
                child: Image.asset(category.image),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                category.name,
                style: TextStyle(fontSize: 18),
              )
            ],
          ));
    }

  showAlertDialogSucess(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed:  () {},
    );
    Widget continueButton = TextButton(
      child: Text("موافق"),
      onPressed:  () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => SignIn()));

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("أنت غير مسجل"),
      content: Text("هل ترغب في تسجيل الدخول ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
class ProgramsBar extends StatelessWidget {
  const ProgramsBar({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle( fontFamily: 'Hacen',color:Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 23),
          ),

        ],
      ),
    );
  }
}
class ButtonInfo extends StatelessWidget {
  const ButtonInfo({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(

        height: 48,
        width: 130,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF598BED))),
        child: Row(
          children: [
            Icon(
              icon,
              color:const Color(0xFF598BED),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }

}


  class datagrid extends StatelessWidget
  {
    const datagrid({
      Key? key, required this.title,required this.image,
    }) : super(key: key);
    final String title;
    final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding( //outer spacing
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 2, // space between items
          children: [Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 50,
                padding: EdgeInsets.all(2),
                child: Image.asset(image),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Heavy',
                    fontSize: 13,
                    color: Colors.blue.shade900),
              )
            ],
          )],
        )

    );
  }


  }


