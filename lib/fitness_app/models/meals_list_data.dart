class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
    this.number = '0',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;
  String number;
  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: 'طلبات رفض جديدة',
      kacl: 525,
      meals: <String>[],
      startColor: '#FA7D82',
      endColor: '#FFB295',number:'1'
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: 'طلبات تم تاكيد رفضها',
      kacl: 602,
      meals: <String>[],
      startColor: '#FE95B6',
      endColor: '#FF5287',number:'2'
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: 'طلبات تم قبولها ولم تصدر',
      kacl: 5,
      meals: <String>[],

      startColor: '#738AE6',
      endColor: '#5C5EDD',number:'3'
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'طلبات تم قبولها واصدرت',
      kacl: 5,
      meals: <String>[],
      startColor: '#6F72CA',
      endColor: '#1E1466',number:'4'
    ),
  ];
}
