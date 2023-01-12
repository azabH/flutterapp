import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:best_flutter_ui_templates/Homa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget{
  @override
  State <StatefulWidget> createState () => _SignInState();
}

class _SignInState extends State<SignIn>{
  bool pass = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  late String errormsg;
  late bool error;
  late String username, password;

  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;

   // _loadCounter();
    //_username.text = "defaulttext";
    //_password.text = "defaultpassword";
  }
  bool _isLog=false;


  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLog = (prefs.getBool('isLog') ?? false);
    });

    if(_isLog) {
      // Your navigation code


      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Home()));
    }
  }
  Widget errmsg(String text) {
    //error message widget.
    return Container(
      padding: EdgeInsets.all(5.00),
      margin: EdgeInsets.only(bottom: 10.00),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
          border: Border.all(color: Colors.red, width: 2)),
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 6.00),
          child: Icon(Icons.info, color: Colors.white),
        ), // icon for error message

        Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
        //show error message text
      ]),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
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
        //color: Colors.red,
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.only(top: 150, left: 10),
        child: const Text('SIGN IN', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white30
        ),),
      ),


      bottomSheet:Form(    key: _formKey,
          child: Container(
        padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color:Colors.white // Color.fromRGBO(236, 236, 236 ,2),
        ),
        width: double.infinity,
        height: 550,
        child: ListView(

          children:  [
            InkWell(
                child: new Padding(
                  padding: EdgeInsets.only(top: 5),
                  child:
                  Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(

                          "assets/images/logo.png",
                          height: 120,
                        ),
                      ),
                    ],
                  )
                ) ,
                onTap: () async {

                })
            ,
      error ?
            Container(
              //show error message here
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(10),
              child:  errmsg(errormsg) ,
              //if error == true then show error message
              //else set empty container as child
            )
          : Container()
            ,
            const SizedBox(height: 5,),

            //email
            const Text("إسم الدخول", textAlign: TextAlign.start, style:  TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue),),
            const SizedBox(height: 5,),
            TextFormField(
              onChanged: (value) {
                //set username  text on change
                username = value;
              },
              controller: _username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

              ),
             keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter  username  ';
                }
                return null;
              },
            ),


            const SizedBox(height: 20,),

            //password
            const Text("كلمة المرور", textAlign: TextAlign.start, style: const TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue),),
            const SizedBox(height: 5,),
            TextFormField(
              onChanged: (value) {
                //set username  text on change
                password = value;
              },
              controller: _password,
              decoration:  InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(pass?Icons.visibility: Icons.visibility_off),
                    onPressed: (){
                    setState(() {
                      pass =! pass;
                    });
                    },

                ),

              ),
              obscureText: pass,
              keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  password  ';
                  }
                  return null;
                }

            ),


            const SizedBox(height: 20,),
            OutlinedButton(

              onPressed: (){

                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('connect to server ...')),
                    );
                    startLogin();
                  }

              },
              child: const Text('تسجيل الدخول',style: TextStyle( fontFamily: 'Heavy',),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                primary: Colors.white,
                fixedSize: const Size(320, 60),
                textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20,),

            //forgetpass
            TextButton(onPressed: (){},
                child: Text('نسيت كلمة المرور',  style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),))
          ],
        ),

      )),
    );
  }

  startLogin() async {

    String apiurl ="http://196.202.30.109/AspNetWebApiRest/api/ListItems/checklogin/"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    //print(username);

    var response = await http.post(Uri.parse(apiurl), body: {
      'username': username, //get the username text
      'password': password //get password text
    });
    print("begin");
    if (response.statusCode == 200) {

      var jsondata = json.decode(response.body);
print(jsondata);

      if (jsondata[0]["error"]==true) {
        setState(() {

          error = true;

          errormsg = jsondata[0]["message"];
        });
      } else {

          setState(() {
            error = false;
            errormsg = jsondata[0]["message"];
          });
          //save the data returned from server
          //and navigate to home page
          String uid = jsondata[0]["uid"];
          String fullname = jsondata[0]["fullname"];
          String username = jsondata[0]["username"];
          String Email = jsondata[0]["Email"];
          String MobileNo = jsondata[0]["MobileNo"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('fullname', fullname);
            prefs.setString('MobileNo', MobileNo);
          prefs.setString('Email', Email);
          prefs.setString('uid', uid);
          prefs.setString('username', username);
          prefs.setBool('isLog', true);

           //get the username text


          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Home()));
          //user shared preference to save data
        }

    }
    else
      {
print("daild");
      setState(() {
        error = true;
        errormsg = "Error during connecting to server.";
      });
    }
  }
}