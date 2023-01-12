import 'package:best_flutter_ui_templates/model/category.dart';

class FakeData {
  List<Category> _categoriesList = <Category>[
    Category(name: 'طلب تأمين سيارات', image: 'assets/images/request.png'),
    Category(name: 'الخدمات التأمينية', image: 'assets/images/3.png'),
    Category(name: 'حساب القسط', image: 'assets/images/22.png'),
    Category(name: 'إتصل بنا', image: 'assets/images/supportIcon.png'),
/*    Category(name: 'تسجيل الدخول', image: 'assets/images/sign.png'),
 Category(name: 'إنشاء حساب', image: 'assets/images/6.png'),
   Category(name: 'کسب و کار', image: 'assets/images/7.png'),
    Category(name: 'دروس آکادمیک', image: 'assets/images/8.png'),
    Category(name: 'مهندسی برق', image: 'assets/images/9.png'),
    Category(name: 'مهندسی صنایع', image: 'assets/images/10.png'),
    Category(name: 'مهندسی عمران', image: 'assets/images/11.png'),
    Category(name: 'مهندسی نرم افزار', image: 'assets/images/12.png'),
    Category(name: 'مهندسی مکانیک', image: 'assets/images/13.png'),
    Category(name: 'هنر', image: 'assets/images/14.png'),*/
  ];

  List<Category> _categoriesList2 = <Category>[
    Category(name: 'تسجيل الدخول', image: 'assets/images/sign.png'),
    Category(name: 'مستخدم جديد', image: 'assets/images/signup.png'),

  ];
  List<Category> get categoriesList => _categoriesList;
  List<Category> get categoriesList2 => _categoriesList2;
}
