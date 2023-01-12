import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:best_flutter_ui_templates/modules/autocompletedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:group_radio_button/group_radio_button.dart';

class Priceme extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Priceme();
  }


}



class _Priceme extends State<Priceme> {
  @override
    apiRequest(String url, Map jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(jsonMap)));
  var response = await http.post(Uri.parse(url), body:jsonMap);

  var jsondata = json.decode(response.body);

    /*
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();

  return reply;

     */
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تسعير وثيقة السيارات'),
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
        body: NavigationExample());
  }
}
TextEditingController _typeAheadController = TextEditingController();
class NavigationExample extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _NavigatorExample ();
  }


}

class _NavigatorExample extends State<NavigationExample> {
  List<User> _userOptions= [];

  void initState() {
    super.initState();
    _getUsers().then( (result) {
      setState(() {
        _userOptions = result;
      });
     });
  }



  Future<List<User>> _getUsers() async {

    var data = await http.get(Uri.parse("http://196.202.30.109/AspNetWebApiRest/api/ListItems/getcardata"));
    var jsonData = json.decode(data.body);
    List<User> _userOptions= [];
    for(var u in jsonData) {
      User user = User(brandMain:u["brandMain"],brandSub:u["brandSub"],brandName: u["brandName"],brandSubName: u["brandSubName"],countryOfOrigin: u["countryOfOrigin"],fullBrandName: u["fullBrandName"]);
      _userOptions.add(user);
    }

    print("the count is " + _userOptions[0].brandMain.toString());
    print(_userOptions);
    return _userOptions;
  }



  static String _displayStringForOption(User option) => option.fullBrandName;


  String _singleValue = "10";
  String countryOfOrigin = "0";
  String brandMain = "0";
  String brandSub = "0";
String msg="0";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _pay = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
    key: _formkey,
    child: SingleChildScrollView(
        child:Column(children: [

      Padding(
        padding: EdgeInsets.all(11.0),
        child: Column(
          children: <Widget>[
            //
            msg!="0" ?
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("مبلغ القسط  ",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Heavy')),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70.0,
                      ),
                      Expanded(child: Text(msg +" جنيه مصري ",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Heavy'),)),
                  ],),
                  SizedBox(height: 10,)
                  ,Text("هذا   القسط تقديري وسيتم تأكيد القسط النهائي بعد الإصدار",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Heavy'))
                ],
              ),
              width: 300,
              height: 150,
              decoration: BoxDecoration(

                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
            )
            :
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/22.png',width: 210,height: 150,),
            ),

         SizedBox(
        height: 10.0,
      ),
            Row(

              children: [
                Text("إختر نوع السيارة",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Heavy'),),
                RadioButton(
                  description: "نقل",
                  value: "3",
                  groupValue: _singleValue,
                  onChanged: (value2) => setState(
                        () => _singleValue =value2.toString(),
                  ),
                  textPosition: RadioButtonTextPosition.right,
                ),
                RadioButton(
                  description: "ملاكى",
                  value: "10",
                  groupValue: _singleValue,
                  onChanged: (value) => setState(
                        () => _singleValue =value.toString()  ,
                  ),
                  activeColor: Colors.blue,
                  textPosition: RadioButtonTextPosition.right,
                ),


              ],

            ),   SizedBox(
              height: 10.0,
            ),
            Row(children: [const Text("إختر الماركة ",style: TextStyle(  fontFamily: 'Heavy',  fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),),],)
    /*
            ,TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _typeAheadController,
                autofocus: true,
                style: DefaultTextStyle
                    .of(context)
                    .style
                    .copyWith(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: ''),
              ),
              suggestionsCallback: (pattern) async {
                return await BackendService.getSuggestions(pattern);
              },
              itemBuilder: (context, Map<String, String> suggestion) {
                return ListTile(
                  title: Text(suggestion['fullBrandName']!),
                  subtitle: Text('${suggestion['fullBrandName']}'),
                );
              },
              onSuggestionSelected: (Map<String, String> suggestion) {

                _typeAheadController.text = suggestion["fullBrandName"].toString();
                brandMain = suggestion["brandMain"].toString();
                brandSub = suggestion["brandSub"].toString();
                countryOfOrigin= suggestion["countryOfOrigin"].toString();
                // your implementation here
              },


            ),
*/
           ,Autocomplete<User>(

              displayStringForOption: _displayStringForOption,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<User>.empty();
                }
                return _userOptions.where((User option) {
                  return option
                      .toString()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (User selection) {
                print(selection.brandMain);

                brandMain = selection.brandMain.toString();
                brandSub = selection.brandSub.toString();
                countryOfOrigin= selection.countryOfOrigin.toString();
              },
            )
          ,  SizedBox(
              height: 20.0,
            ),
            Row(children: [const Text("مبلغ تأمين السيارة  ",style: TextStyle(fontFamily: 'Heavy', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),),],),
         SizedBox(
        height: 10.0,
      ),
            TextFormField(
              onChanged: (value) {
                //set username  text on change

              },
              controller: _pay,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'أدخل مبلغ التأمين  ';
                }
                return null;
              },
            ),

            SizedBox(
              height: 10.0,
            ),
            OutlinedButton(



                onPressed: () {
                  if (_formkey.currentState!.validate()) {

                    sendData();
                  } else {

                  }
              },
              child: const Text('حساب القسط',style: TextStyle(fontFamily: 'Heavy'),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                primary: Colors.white,
                fixedSize: const Size(320, 60),
                textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),



           // Row(children: [Text("القسط المطلوب سداده",style: TextStyle(color: Colors.black54,fontSize: 14),),SizedBox(width: 10,), Text(msg,style: TextStyle(color: Colors.red,fontSize: 16))],)

          ],
        ),
      )
    ],) ));
  }



  Future   sendData()  async{

    String url =
        'http://196.202.30.109/AspNetWebApiRest/api/ListItems/priceme';
    Map data = {
      'CountryOfOrigin_hid': countryOfOrigin,
      'gas': "1",
      'Brand': brandMain,
      'vehicleType': brandSub,
      'Txt_carType':_singleValue,
      'FirstYear': _pay.text,
      'IsResmand1': false,
      'IsResmand2': false,
      'IsResmand3': false,
      'Remove_MandatoryClaim_Commercial': false,
      'Remove_MandatoryClaim_Specialcars': false,
      'Chk_RemoveTawkeelCond': false,
      'DrivingSumInsured': "0",
      'RidingSumInsured': "0",
      'CivilizSumInsured': "0",
      'PassengerCount': "0",
      'BoxInsVal': "0",
      'FridgeInsVal': "0",
      'AdvInsVal': "0"
    };

    String body = json.encode(data);
    var response = await http.post(Uri.parse(url), body:body,  headers: {"Content-Type": "application/json"}, );


   print(brandMain)   ;
    print(brandSub) ;
    print(countryOfOrigin);
    print(_pay.text);
    print(_singleValue);




    if (response.statusCode == 200) {
      print(response.body); //print raw response on console
      var data = json.decode(response.body); //decoding json to array


      setState(() { //refresh the UI when error is recieved from server

        msg = data["totalPrem"]; //error message from server
      });
      }

    else{
      //there is error
      setState(() {

        msg = "Error during sendign data.";

        //mark error and refresh UI with setState
      });
    }
  }
}





@immutable
class User {
  const User({
    required this.brandMain,
    required this.brandSub,
    required this.brandName,
    required this.brandSubName,
    required this.countryOfOrigin,
    required this.fullBrandName,
  });

  final int brandMain;
  final int brandSub;
  final String brandName;
  final String brandSubName;
  final String countryOfOrigin;
  final String fullBrandName;

  @override
  String toString() {
    return '$brandMain, $brandSub,$brandName, $brandSubName,$countryOfOrigin, $fullBrandName';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is User && other.brandMain == brandMain && other.brandSub == brandSub && other.brandName == brandName && other.brandSubName == brandSubName&& other.countryOfOrigin == countryOfOrigin && other.fullBrandName == fullBrandName;
  }

  @override
  int get hashCode => Object.hash(brandMain, brandSub,brandName,brandSubName,countryOfOrigin,fullBrandName);
}