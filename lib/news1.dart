import 'package:best_flutter_ui_templates/Homa.dart';
import 'package:flutter/material.dart';

class news1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _news1();
  }
}

class _news1  extends State<news1>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:  AppBar(
      title: Text('أخبار الشركة'),
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ),
    body: Container(
      child: new Column(
        children: <Widget>[
          const SizedBox(height: 5,),
          Text("عربيتك في أمان" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
          Image.asset('assets/images/news1.png'),

          const SizedBox(height: 5,),
          new Column(
            children: <Widget>[
              new Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                  "قامت شركة قناة السويس تصدر برنامج إصدار وثيقة السيارات والتى تسهل علي المواطنين اصدار الوثائق بسهولة وفي وقت قصير")
            ],
          )

       ,   const SizedBox(height: 30,),    InkWell(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.blue,
                ),
                title:Text(
                  ' رجوع',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.blue.shade900),
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()));
              //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
            },
          ) ],
      ),

    ),
    );
  }

}

class news2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _news2();
  }
}
class _news2  extends State<news2>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:  AppBar(
      title: Text('أخبار الشركة'),
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ),
      body:

      Container(
        child: new Column(
          children: <Widget>[
            const SizedBox(height: 5,),
            Text("وفر وقتك واشتري رحلتك" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
            Image.asset('assets/images/news2.jpg'),

            const SizedBox(height: 5,),
            new Column(
              children: <Widget>[
                new Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                    "دولوقتي تقدر تامن عربيتك وانت في مكانك عن طريق تطبيق قناة السويس الذي يسهل عليك اصدار وثيقة السيارات في الحال")
              ],
            )

            ,   const SizedBox(height: 30,),    InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.blue,
                  ),
                  title:Text(
                    ' رجوع',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()));
                //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
              },
            ) ],
        ),

      )


    );
  }

}