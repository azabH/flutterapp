import 'package:best_flutter_ui_templates/Homa.dart';
import 'package:flutter/material.dart';


class contactus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _contactus();
  }


}

class  _contactus extends State<contactus>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/logo.png",
                height: 60,
              ),

            ),
            Text(
              'suez canal insurance',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'قناة السويس للتأمين'.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'SourceSansPro',
                color: Colors.blue.shade100,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150,
              child: Divider(
                color: Colors.blue.shade100,
              ),
            ),
            InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '16569',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.blue.shade900),
                    ),
                  ),

                ),
                onTap: (){
                  //  _launchURL('tel:16569');
                }
            ),
            InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title:Text(
                    ' info@sci-egypt.com',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              onTap: (){
                //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
              },
            ),
            InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '10 شارع ايران الدقى - الجيزة',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.blue.shade900),
                    ),
                  ),

                ),
                onTap: (){
                  //  _launchURL('tel:16569');
                }
            ),
            InkWell(
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
            )
          ],
        ),
      ),
    );
  }



}









