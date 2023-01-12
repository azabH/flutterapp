import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:best_flutter_ui_templates/modules/buildpage.dart';
import 'package:best_flutter_ui_templates/modules/choosepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Homa.dart';

class OnBoarding extends StatefulWidget{
  @override
  State <StatefulWidget> createState () => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>{

   String urlImage = '';
   String title = '';
   String subtitle = '';
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         padding: const EdgeInsets.only(bottom: 80),
         child: PageView(
           controller: controller,
           onPageChanged: (index){
             setState(() => isLastPage = index == 2);
           },
           children: const [

             BuildPage(
               urlImage: 'assets/images/fly.png',
               title: 'إدخال بيانات السيارة',
               subtitle: 'يتيح لك البرنامج سهولة في إصدار وثيقة السيارات عن طريق خطوات بسيطة اولها  إدخال البيانات الشخصية وبيانات السيارة',
             ),

             BuildPage(
               urlImage: 'assets/images/date.png',
               title: 'حساب القسط ',
               subtitle: 'الخطوة الثانية حساب قسط التأمين من خلال بيانات السيارة ',
             ),

             BuildPage(

               urlImage: 'assets/images/home.png',
               title: 'الدفع واستلام الوثيقة ',
               subtitle: 'يتم الدفع بصوة امنه وإستلام الوثيقة ',
             ),

           ],
         ),
       ),

       bottomSheet: isLastPage
         ? TextButton(
           style: TextButton.styleFrom(
             primary: Colors.white,
             backgroundColor: Colors.blue.shade700,
             minimumSize: const Size.fromHeight(60),
           ),
           onPressed: () async{
             //navigate to choose page
               Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (context) => Home()),
             );
           },

           child: const Text(
             'إبدأ الأن',
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,     fontFamily: 'Heavy',
               fontWeight: FontWeight.bold,
             ),
           ),
         )
           :Container(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         height: 80,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

             //skip
             TextButton(
                 onPressed: () =>
         {
         //controller.jumpToPage(2);
                 Navigator.of(context).pushReplacement(
                 MaterialPageRoute(builder: (context) => Home()),
                 )
         },
                 child: const Text('تخطى', style: TextStyle(
                     fontFamily: 'Heavy',
                     fontSize: 13 ))),
             //dots
             Center(
               child: SmoothPageIndicator(
                 controller: controller,
                 count: 3,
                 effect:const WormEffect(
                   spacing: 20,
                   dotColor: Colors.black26,
                   activeDotColor: Colors.blue,
                 ),
                 //to click on dots and move
                 onDotClicked: (index) => controller.animateToPage(
                   index,
                   duration: const Duration(milliseconds: 500),
                   curve: Curves.ease,
                 ),
               ),
             ),
             //next
             TextButton(
                 onPressed: () => controller.nextPage(
                   duration: const Duration(milliseconds: 500),
                   curve: Curves.ease,),
                 child: const Text('التالى', style: TextStyle(
                     fontFamily: 'Heavy',
                     fontSize: 13,
                     ))),
           ],
         ),
       ),
     );
  }
}
