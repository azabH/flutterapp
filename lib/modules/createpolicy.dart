import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart' as intl;
import 'package:group_radio_button/group_radio_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class createpolicy extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<createpolicy> {

  String msg="";
  bool error=false;
  bool _isLog=false;
  String fullname="";
  String MobileNo="";
  String Email="";
  String uid="";
String ReqId="";
   List<String>  items = ["بطاقة الرقم القومى",  "جواز السفر" ];
  List<String> Identitylist = ["شركات",  "أفراد" ];

  String? IdType ;


  bool is_samedata=false;
  String _TaxNumb = "1";
  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();
  TextEditingController _insName= TextEditingController();
  TextEditingController _MobileNo = TextEditingController();
  TextEditingController _Email = TextEditingController();
   TextEditingController _Jop = TextEditingController();
  TextEditingController _InsDateFrom= TextEditingController();
  TextEditingController _InsDateTo = TextEditingController();

  String? _Identity ;
  TextEditingController _NationalId = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _BankName = TextEditingController();
  TextEditingController _benefNumb = TextEditingController();
  TextEditingController _BenefAddress = TextEditingController();
  TextEditingController _BenefID = TextEditingController();
  TextEditingController _BenefEmail = TextEditingController();
  TextEditingController _BrokerageCompany = TextEditingController();

  List<BasicData> _userOptions= [];
  @override
  void initState() {
    _loadCounter();
    _GetBasicData();
    super.initState();
  }


  @override
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      uid=prefs.getString('uid')!;
    });





    if(prefs.getBool('isLog') != null)
    {

      setState(() {
        _isLog=prefs.getBool('isLog')!;
      });
    }

    if(prefs.getString('fullname') != null)
    {
      setState(() {
        fullname=_userOptions.length == 0 ? prefs.getString('fullname')! : _userOptions[0].insName.toString();
      });

    }

    if(prefs.getString('MobileNo') != null)
    {
      setState(() {
        MobileNo=_userOptions.length == 0 ? prefs.getString('MobileNo')! : _userOptions[0].MobileNo.toString();
        _MobileNo.text=MobileNo;
      });

    }

    if(prefs.getString('Email') != null)
    {
      setState(() {
        Email=_userOptions.length == 0 ? prefs.getString('Email')! : _userOptions[0].Email.toString();
        _Email.text=Email;

      });

    }


  }


  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 8; // upperBound MUST BE total number of icons minus 1.

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text('إصدار وثيقة تأمين السيارات إلكترونيا',style:TextStyle(
              fontFamily: 'Heavy',
              fontSize: 14,
              color: Colors.white)),
        ),
        body:bodyBuilder());
  }


  Widget bodyBuilder() {
    switch (activeStep) {
      case 0:
        return basicDetails();
      case 1:
        return form1();
      case 2:
        return form2();
      case 3:
        return form3();
      case 4:
        return form4();
      case 5:
        return form5();
      case 6:
        return form6();
      case 7:
        return form7();
      default:
        return basicDetails();
    }
  }
  Widget basicDetails() {

    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconStepper(
            icons: [
              Icon(Icons.account_circle_sharp),
              Icon(Icons.outlined_flag_rounded),
              Icon(Icons.directions_car_sharp),
              Icon(Icons.mode_edit),
              Icon(Icons.ac_unit_sharp),
              Icon(Icons.wysiwyg_outlined),
              Icon(Icons.pause_presentation),
              Icon(Icons.attach_money),
            ],

            // activeStep property set to activeStep variable defined above.
            activeStep: activeStep,

            // This ensures step-tapping updates the activeStep.
            onStepReached: (index) {
              if (basicFormKey.currentState?.validate() ?? false) {
                // next
                setState(() {
                  activeStep = index;
                });
              }
              setState(() {

              });
            },
          ),
          header(),
                  /*  Expanded(
                child: FittedBox(
                  child: Center(
                    child: Text('$activeStep'),
                  ),
                ),
              ),*/

          /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),*/
        ],
      ),
    ),
           msg!=""
          ?
          Container(
            child:Text(msg,style:TextStyle(backgroundColor: Colors.redAccent[100],color:Colors.white)),
            //if there is error then sho msg, other wise show text message
          )
               :
           Container(
                        //if there is error then sho msg, other wise show text message
           )
          ,

              Text("نوع الترخيص",style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)),
              RadioButton(
                description: "سيارة ملاكي",
                value: "2",
                groupValue: _TaxNumb,
                onChanged: (value2) => setState(
                      () => _TaxNumb =value2.toString(),
                ),
                textPosition: RadioButtonTextPosition.right,
              ),

              RadioButton(
                description: "سيارة تجاري",
                value: "1",
                groupValue: _TaxNumb,
                onChanged: (value) => setState(
                      () => _TaxNumb =value.toString()  ,
                ),
                activeColor: Colors.blue,
                textPosition: RadioButtonTextPosition.right,
              ),


          SizedBox(height: 10,),
          TextFormField(
            controller: _insName,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(

                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "إسم المؤمن له كما هو مدون بالهوية",
            ),
            validator: RequiredValidator(
              errorText: "مطلوب *",
            ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _MobileNo,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "رقم التليفون",
            ),
            keyboardType: TextInputType.number,
            validator:  MinLengthValidator(
              6,
              errorText: "رقم التليفون 10 ارقام",
            ),
style: TextStyle(
    fontFamily: 'Heavy',
    fontSize: 14,
    height: 0.9,
    color: Colors.blue.shade900),

          ),
          SizedBox(height: 10,),
          TextFormField(
              controller: _Email,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "البريد الالكتروني",
              ),
            style: TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue.shade900),
              validator: MultiValidator([
                RequiredValidator(
                  errorText: "مطلوب *",
                ),
                EmailValidator(
                  errorText: "صغية البريد غير صحيحة",
                ),
              ])),
          SizedBox(height: 10,),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'الجهة المؤمنه',
                      style: TextStyle(
                        fontSize: 14,
                        height: 0.9,

                        fontFamily: 'Heavy',

                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: Identitylist
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: _Identity,
              onChanged: (value){
                setState(() {
                  _Identity = value.toString();
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey.shade50,
              buttonHeight: 40,
              buttonWidth: 160,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.grey.shade300,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 200,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade100,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),
          SizedBox(height: 10,),


          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'نوع الهوية',
                      style: TextStyle(
                        fontSize: 14,
                        height: 0.9,

                        fontFamily: 'Heavy',

                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: IdType,
              onChanged: (value){
                setState(() {
                  IdType = value.toString();
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey.shade50,
              buttonHeight: 40,
              buttonWidth: 160,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.grey.shade300,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 200,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade100,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),

          SizedBox(height: 10,),
          TextFormField(
            controller: _NationalId,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "رقم الهوية ",
            ),
            style: TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue.shade900),
            keyboardType: TextInputType.number,
            validator: RequiredValidator(
    errorText: "مطلوب *",
    )

          ),
          SizedBox(height: 6,),
          TextFormField(
            controller: _Address,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "العنوان ",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "مطلوب *",
            ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _Jop,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "الوظيفة أو المهنة ",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "مطلوب *",
            ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          SizedBox(height: 10,),
          TextField(

            controller: _InsDateFrom, //editing controller of this TextField
            decoration: InputDecoration(
    border: const OutlineInputBorder(

    borderSide: BorderSide(),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "بداية تاريخ السريان" //label text of field
            ),
            style: TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue.shade900),
            readOnly: true,  //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(),
                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if(pickedDate != null ){
                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement
                DateTime pickedDate2=pickedDate.add(Duration(days: 365));
                setState(() {
                  _InsDateFrom.text = formattedDate; //set output date to TextField value.
                  _InsDateTo.text = DateFormat('yyyy-MM-dd').format(pickedDate2);
                });
              }else{
                print("Date is not selected");
              }
            },
          )
          , SizedBox(height: 17,),
          TextFormField(
            readOnly: true,

            controller: _InsDateTo,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "نهاية تاريخ السريان",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "مطلوب *",
            ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),const SizedBox(
            height: 12.0,
          ),
          Row( children :[
            Checkbox(
              value: is_samedata,
              onChanged: (value) {
                setState(() {
                  is_samedata = value as bool;


                });
                if(is_samedata==true)
                  {
                    _BankName.text=_insName.text;
                    _BenefID.text=_NationalId.text;
                    _benefNumb.text=_MobileNo.text;
                    _BenefAddress.text=_Address.text;
                    _BenefEmail.text=_Email.text;

                  }
                else
                  {
                    _BankName.text="";
                    _BenefID.text="";
                    _benefNumb.text="";
                    _BenefAddress.text="";
                    _BenefEmail.text="";

                  }
              },
            ),
            Text("المستفيد هو نفسه المؤمن له", style: TextStyle(
    fontFamily: 'Heavy',
    fontSize: 14,
    height: 0.9,
    color: Colors.blue.shade900)),

          ]),

          TextFormField(
              controller: _BankName,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(

                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "اسم المستفيد",
              ),
              validator: RequiredValidator(
                errorText: "مطلوب *",
              ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _benefNumb,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              labelText: "رقم تليفون المستفيد",
            ),
            keyboardType: TextInputType.number,
            validator:  MinLengthValidator(
              6,
              errorText: "رقم التليفون 10 ارقام",
            ),
            style: TextStyle(
                fontFamily: 'Heavy',
                fontSize: 14,
                height: 0.9,
                color: Colors.blue.shade900),

          ),
          SizedBox(height: 10,),
          TextFormField(
              controller: _BenefAddress,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "عنوان المستفيد",
              ),
              validator: RequiredValidator(
                errorText: "مطلوب *",
              ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          SizedBox(height: 10,),

          TextFormField(
              controller: _BenefID,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "رقم هوية المستفيد ",
              ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900),
              keyboardType: TextInputType.number,


          ),
          SizedBox(height: 10,),
          TextFormField(
              controller: _BenefEmail,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "البريد الالكتروني للمستفيد",
              ),
              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900),
              validator: MultiValidator([
                RequiredValidator(
                  errorText: "مطلوب *",
                ),
                EmailValidator(
                  errorText: "صغية البريد غير صحيحة",
                ),
              ])),
          SizedBox(height: 10,),
          TextFormField(
              controller: _BrokerageCompany,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: "رقم قيد وسيط التأمين بالهيئة",
              ),

              style: TextStyle(
                  fontFamily: 'Heavy',
                  fontSize: 14,
                  height: 0.9,
                  color: Colors.blue.shade900)
          ),
          /* TextFormField(
            controller: _password,
            decoration: const InputDecoration(
              labelText: "Passoword",
            ),
            validator: MinLengthValidator(
              6,
              errorText: "Min 6 characters required",
            ),
          ),*/
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  savebasicdata();
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Heavy',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget form1() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {

                      // next
                      setState(() {
                        activeStep = index;
                      });


                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next

                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget form2() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form3() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget form4() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form5() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form6() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next

                //  if (error == false) {
                   // setState(() {
                    //  activeStep++;
                 //   });
                 // }
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form7() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconStepper(
                  icons: [
                    Icon(Icons.account_circle_sharp),
                    Icon(Icons.outlined_flag_rounded),
                    Icon(Icons.directions_car_sharp),
                    Icon(Icons.mode_edit),
                    Icon(Icons.ac_unit_sharp),
                    Icon(Icons.wysiwyg_outlined),
                    Icon(Icons.pause_presentation),
                    Icon(Icons.attach_money),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                header(),

              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if (basicFormKey.currentState?.validate() ?? false) {
                  // next
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text(
                "التالى",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
 /* Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('التالى',style: TextStyle(
          fontFamily: 'Heavy',
          fontSize: 12,
          color: Colors.blue.shade900),),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('السابق',style: TextStyle(
          fontFamily: 'Heavy',
          fontSize: 13,
          color: Colors.blue.shade900),),
    );
  }*/

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Heavy',
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
        case 0:
        return "   البيانات الأساسية  ${activeStep + 1} من $upperBound ";

      case 1:
        return "    الاقرارات و الافصاح  ${activeStep + 1} من $upperBound ";

      case 2:
        return " بيانات خاصة بالسيارة  ${activeStep + 1} من $upperBound ";

      case 3:
        return "  البيانات المالية للسيارة ${activeStep + 1} من $upperBound ";

      case 4:
        return  "         التغطيات الإضافية   ${activeStep + 1} من $upperBound ";
      case 5:
        return "ملخص الأقساط ${activeStep + 1} من $upperBound ";
      case 6:
        return "  مستندات المطلوبة ${activeStep + 1} من $upperBound ";
    // Here, default corresponds to the index value = 0.
      case 7:
         return "   السداد  ${activeStep + 1} من $upperBound ";
      default:
        return '';
    }
  }


  Future   savebasicdata()  async{



    print ("send");

    // url to registration php script
    String APIURL = "http://196.202.30.109/AspNetWebApiRest/api/ListItems/EntryBasicData";
    //json maping user entered details
    Map mapeddate ={
    'MobileNo': _MobileNo.text ,
    'Email': _Email.text ,
    'insType':  '0',
    'InsDateFrom': _InsDateFrom.text ,
    'InsDateTo': _InsDateTo.text ,
    'carType':  '0',
    'Identity': _Identity ,
    'IdType': IdType.toString() =="بطاقة الرقم القومى" ?"1":"2",
    'TaxNumb':  _TaxNumb.toString(),
    'NationalId': _NationalId.text ,
    'Address': _Address.text ,
    'Jop': _Jop.text ,
    'BankName': _BankName.text ,
    'benefNumb': _benefNumb.text ,
    'BenefAddress': _BenefAddress.text ,
    'BenefID': _BenefID.text ,
    'BenefEmail': _BenefEmail.text ,
    'BrokerageCompany': _BrokerageCompany.text=="" ?"0":_BrokerageCompany.text,
    'uid': uid ,
    'insName':  _insName.text
    };
    print(mapeddate);
    //send  data using http post to our php code
    http.Response  res= await http.post(Uri.parse(APIURL) ,body:mapeddate);


    if (res.statusCode == 200) {
       //print raw response on console
      var data = json.decode(res.body); //decoding json to array

      if(data["error"]!="true"){

        setState(() {
          //refresh the UI when error is recieved from server
                   msg = data["message"];
                   error=data["error"];
                   ReqId=data["ReqId"];
        });
      }

      else{

        setState(() {

          msg = "";


        });


      }

    }else{
      //there is error
      setState(() {

        msg = "Error during sendign data.";

        //mark error and refresh UI with setState
      });
    }



  }


  /*Future<List<BasicData>>*/ _GetBasicData() async {

    String APIURL = "http://196.202.30.109/AspNetWebApiRest/api/ListItems/GetBasicData";
    //json maping user entered details
    Map mapeddate ={
      'uid': 'f2e74e2a-59d4-4961-ac1a-1cb0d434a321'

    };
    //send  data using http post to our php code
    http.Response  res= await http.post(Uri.parse(APIURL) ,body:mapeddate);

    if (res.statusCode == 200) {
    /*sucess*/
    }
    else
  {

    /*faild*/
  }
    print(res.body);
    var jsonData = json.decode(res.body);

    List<BasicData> _userOptions= [];
    for(var u in jsonData) {
      BasicData user = BasicData(insName:u["insName"],MobileNo:u["MobileNo"],Email: u["Email"],insType: u["insType"],InsDateFrom: u["InsDateFrom"],InsDateTo: u["InsDateTo"], carType:u["carType"],    Identity:u["Identity"] ,   IdType:u["IdType"] ,    TaxNumb:u["TaxNumb"] ,    NationalId:u["NationalId"] , Address :u["Address"],Jop:u["Jop"] ,BankName:u["BankName"] , benefNumb :u["benefNumb"] ,  BenefAddress :u["BenefAddress"],  BenefID :u["BenefID"],  BenefEmail :u["BenefEmail"], BrokerageCompany :u["BrokerageCompany"]);
      _userOptions.add(user);
    }
    _insName.text=_userOptions[0].insName.toString();
    _MobileNo.text=_userOptions[0].MobileNo.toString();
    _Email.text=_userOptions[0].Email.toString();
    _InsDateFrom.text=_userOptions[0].InsDateFrom.toString();
    _InsDateTo.text=_userOptions[0].InsDateTo.toString();
   // _Identity.text=_userOptions[0].Identity.toString();
    Identitylist.indexOf(_userOptions[0].Identity.toString());
    _NationalId.text=_userOptions[0].NationalId.toString();
    _Address.text=_userOptions[0].Address.toString();
    _Jop.text=_userOptions[0].Jop.toString();
    _BankName.text=_userOptions[0].BankName.toString();
    _benefNumb.text=_userOptions[0].benefNumb.toString();
    _BenefAddress.text=_userOptions[0].BenefAddress.toString();
    _BenefID.text=_userOptions[0].BenefID.toString();
    _BenefEmail.text=_userOptions[0].BenefEmail.toString();
    _BrokerageCompany.text=_userOptions[0].BrokerageCompany.toString();
   // print("the count is " + _userOptions[0].insName.toString());


    /*_userOptions[0].insName;*/
   // return _userOptions;
  }

}

@immutable
class BasicData {
  const BasicData({
    required this.insName,
    required this.MobileNo,
    required this.Email ,
    required this.insType ,
    required this.InsDateFrom ,
    required this.InsDateTo ,
    required this.carType,
    required this.Identity ,
    required this.IdType ,
    required this.TaxNumb ,
    required this.NationalId ,
    required this.Address ,
    required this.Jop ,
    required this.BankName ,
    required this.benefNumb ,
    required this.BenefAddress ,
    required this.BenefID ,
    required this.BenefEmail ,
    required this.BrokerageCompany
  });

  final String insName;
  final String MobileNo;
  final String Email ;
  final String insType ;
  final String InsDateFrom;
  final String InsDateTo ;
  final String carType;
  final String Identity ;
  final String IdType;
  final String TaxNumb ;
  final String NationalId;
  final String Address;
  final String Jop ;
  final String BankName;
  final String benefNumb ;
  final String BenefAddress;
  final String BenefID ;
  final String BenefEmail ;
  final String BrokerageCompany;

}