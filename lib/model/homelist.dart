import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/1.jpg',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/2.jpg',
      navigateScreen: HotelHomeScreen(person: "1"),
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/3.jpg',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/4.jpg',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
