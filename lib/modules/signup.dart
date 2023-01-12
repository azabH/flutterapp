import 'dart:convert';
import 'package:best_flutter_ui_templates/modules/signinpage.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:http/http.dart' as http;
import 'package:best_flutter_ui_templates/Homa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget{
  @override
  State <StatefulWidget> createState () => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  bool pass = true;
  final _formKey = GlobalKey<FormState>();
  late String errormsg;
  late bool error;
  late String username="", password="",email="",fullname="",mobile="";
   TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _fullname = TextEditingController();
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

        Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
        //show error message text
      ]),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل مستخدم جديد'),
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
        child: const Text('SIGN UP', style: TextStyle(
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
              color: Color.fromRGBO(236, 236, 236 ,2),
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


                const SizedBox(height: 30,),

                //name
                 Text("الإسم بالكامل", textAlign: TextAlign.start, style: const TextStyle(
                    color: Colors.blue,
                     fontFamily: 'Heavy',
                     fontSize: 14,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 5,),



                TextFormField(
                    onChanged: (value) {
                      //set username  text on change
                      fullname = value;
                    },
                    controller: _fullname,
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),


                    ),

                    keyboardType: TextInputType.text,
                    validator: RequiredValidator(
                      errorText: "مطلوب *",
                    )

                )
                ,


                  SizedBox(height: 20,),

                //email
                const Text("البريد الإلكترونى", textAlign: TextAlign.start, style: const TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Heavy',
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: _email,
                    onChanged: (value) {
                      //set username  text on change
                      email = value;
                    },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),

                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:  MultiValidator([
                    RequiredValidator(
                      errorText: "مطلوب *",
                    ),
                    EmailValidator(
                      errorText: "صغية البريد غير صحيحة",
                    ),
                  ]),
                ),


                const  SizedBox(height: 20,),


                //phone
                const Text("الموبايل", textAlign: TextAlign.start, style: const TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Heavy',
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: _mobile,
                    onChanged: (value) {
                      //set username  text on change
                      mobile = value;
                    },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),

                  ),
                  keyboardType: TextInputType.phone,
                    validator:  MinLengthValidator(
                      6,
                      errorText: "رقم التليفون 10 ارقام",
                    )
                ),

                const SizedBox(height: 20,),

                //email
                const Text("إسم الدخول", textAlign: TextAlign.start, style: const TextStyle(
                    fontFamily: 'Heavy',
                    fontSize: 14,
                    height: 0.9,
                    color: Colors.blue),),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: _username,
                  onChanged: (value) {
                    //set username  text on change
                    username = value;
                  },

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

                    controller: _password,
                    onChanged: (value) {
                      //set username  text on change
                      password = value;
                    },

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
                new SizedBox(
                  height: 5,
                ),
                new FlutterPwValidator(
                  controller: _password,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  normalCharCount: 3,
                  width: 400,
                  height: 150,
                  onSuccess: () {
                    print("MATCHED");
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: new Text("Password is matched")));
                  },
                  onFail: () {
                    print("NOT MATCHED");
                  },
                ),
                //password
                const Text("تأكيد كلمة المرور", textAlign: TextAlign.start, style: const TextStyle(
                    fontFamily: 'Heavy',
                    fontSize: 14,
                    height: 0.9,
                    color: Colors.blue),),
                const SizedBox(height: 5,),
                TextFormField(
                    controller: _repassword,
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
                      if(value != _password.text)
                        return 'password Not Match';
                      return null;
                    }

                ),
                const SizedBox(height: 5,),
                new FlutterPwValidator(
                  controller: _repassword,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  normalCharCount: 3,
                  width: 400,
                  height: 150,
                  onSuccess: () {
                    print("MATCHED");
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: new Text("Password is true")));
                  },
                  onFail: () {
                    print("NOT MATCHED");
                  },
                )       ,  const SizedBox(height: 50,),

                OutlinedButton(

                  onPressed: (){

                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('connect to server to add inforamation   ...')),
                      );
                      startResgister();
                    }





                  },
                  child: const Text('تسجيل البيانات'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    primary: Colors.white,
                    fixedSize: const Size(320, 60),
                    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Heavy',),
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

  startResgister() async {

    String apiurl ="http://196.202.30.109/AspNetWebApiRest/api/ListItems/creatnewaccount/"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    //print(username);

    var response = await http.post(Uri.parse(apiurl), body: {
      'fullname': fullname, //get the username text
      'mobile': mobile,
      'email': email, //get the username text
      'username': username, //get the username text
      'password': password //get password text
    });

    if (response.statusCode == 200) {

      var jsondata = json.decode(response.body);


      if (jsondata[0]["error"]==true) {
        setState(() {

          error = true;

          errormsg = jsondata[0]["message"];
          showfailAlertDialog(context);
        });
      } else {

        setState(() {
          error = false;
          errormsg = jsondata[0]["message"];
          showAlertDialogSucess(context);
        });



        //user shared preference to save data
      }

    }
    else
    {
      showfailAlertDialog(context);
      setState(() {
        error = true;
        errormsg = "Error during connecting to server.";
      });
    }
  }
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
    title: Text("تم التسجيل بنجاح"),
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


showfailAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("موافق"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("خطأ  "),
    content: Text("هناك مشكلة حدثت أثناء التسجيل "),
    actions: [
      okButton,
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