import 'package:best_flutter_ui_templates/fitness_app/ui_view/glass_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:best_flutter_ui_templates/data.dart';
import 'package:best_flutter_ui_templates/model/category.dart';

import 'events_and_experiences.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'modules/signinpage.dart';
import 'modules/signup.dart';
class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _Grideview();
  }
}
class _Grideview extends State<GridViewPage>
{
  @override
  Widget build(BuildContext context) {
    List<Category> _list = FakeData().categoriesList;
    List<Category> _list2 = FakeData().categoriesList2;
    int selectedCard = -1;
    int _index = 0;
    void _onItemTapped(int index) {
      setState(() {
        _index = index;
      });

     if(_index==3)
       {
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) =>  SignIn()),
         );
       }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('قناة السويس للتأمين'),
        ),  bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: const Color(0xFF598BED),
      showUnselectedLabels: true,

      unselectedItemColor: const Color(0xFF6D747A),
      onTap: _onItemTapped,
      items:  const [
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
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'تسجيل الدخول',

        ),

      ],

    ),
        body:SingleChildScrollView(
            child: Container(

              child:  Column(children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                  child: AnimationLimiter(
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
                                  print(index);
                                },
                                child:  AnimationConfiguration.staggeredGrid(

                                    columnCount: 2,
                                    position: index,
                                    duration: Duration(milliseconds: 20),
                                    child: ScaleAnimation(
                                        child: FadeInAnimation(
                                            delay: Duration(milliseconds: 20),
                                            child: listItem2(_list2[index])))));
                          })),
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
                    title: 'أخبار الشركة'
                ),
                SizedBox(height: 5,),
                EventsAndExperiences(),
                ProgramsBar(
                    title: 'خدمتنا'
                ),

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
                                  print(index);
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
                ),    SizedBox(height: 5,),



              ]),
            )) );
  }
  Widget listItem2(Category category) {

 return   Padding( //outer spacing
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
             child: Image.asset(category.image),
           ),
           SizedBox(
             height: 2,
           ),
           Text(
             category.name,
             style: TextStyle(fontSize: 14),
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
            style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
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