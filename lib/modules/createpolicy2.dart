import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class createpolicy2 extends StatefulWidget {
  const createpolicy2({Key? key}) : super(key: key);

  @override
  _MultiPageBasicState createState() => _MultiPageBasicState();
}
class National {
  const National(this.id,this.name);

  final String name;
  final int id;
}
class _MultiPageBasicState extends State<createpolicy2> {
  //
  List<String>  items = ["بطاقة الرقم القومى",  "جواز السفر" ];
  String? selectval ;
  late DateTime  _selectedDate;
  bool is_samedata=false;
  TextEditingController _date = TextEditingController();
  TextEditingController _date2 = TextEditingController();
  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
   TextEditingController _email = TextEditingController();

  int activeIndex = 0;
  int totalIndex = 3;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "إصدار وثيقة تأمين السيارات إلكترونيا", style: TextStyle(
              fontFamily: 'Heavy',
              fontSize: 13,
              )
          ),
        ),
        //
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return basicDetails();
      case 1:
        return educationDetails();
      case 2:
        return educationDetails();
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
          Center(
            child:DotStepper(
              activeStep: activeIndex,
              dotRadius: 20.0,
              shape: Shape.pipe,
              spacing: 10.0,
            )),

          Text(
            "البيانات الأساسية${activeIndex + 1} من $totalIndex",
            style: const TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "إسم المؤمن له كما هو مدون بالهوية",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "رقم التليفون",
            ),
            keyboardType: TextInputType.number,
            validator: RequiredValidator(
              errorText: "Required *",
            ),


          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _email,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                labelText: "البريد الالكتروني",
              ),
              validator: MultiValidator([
                RequiredValidator(
                  errorText: "Required *",
                ),
                EmailValidator(
                  errorText: "Not Valid Email",
                ),
              ])),
          SizedBox(height: 10,),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "الجهة المؤمنة:",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
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
                        fontWeight: FontWeight.bold,
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
              value: selectval,
              onChanged: (value){
    setState(() {
    selectval = value.toString();
    });
    },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey.shade50,
              buttonHeight: 50,
              buttonWidth: 160,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
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
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "رقم الهوية ",
            ),
            keyboardType: TextInputType.number,
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          SizedBox(height: 6,),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "العنوان ",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "الوظيفة أو المهنة ",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          SizedBox(height: 10,),
    TextField(
    controller: _date, //editing controller of this TextField
    decoration: InputDecoration(
    icon: Icon(Icons.calendar_today), //icon of text field
    labelText: "بداية تاريخ السريان" //label text of field
    ),
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
      _date.text = formattedDate; //set output date to TextField value.
      _date2.text = DateFormat('yyyy-MM-dd').format(pickedDate2);
    });
    }else{
    print("Date is not selected");
    }
    },
    )
          , SizedBox(height: 17,),
          TextFormField(
            readOnly: true,

             controller: _date2,
            decoration: const InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelText: "نهاية تاريخ السريان",
            ),
            keyboardType: TextInputType.text,
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),const SizedBox(
    height: 12.0,
    ),
Row( children :[
  Text(""),
Checkbox(
  value: is_samedata,
  onChanged: (value) {
    setState(() {
      is_samedata = value as bool;
    });
  },
)
]),


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
                  setState(() {
                    activeIndex++;
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

  Widget educationDetails() {
    return ListView(
      padding: const EdgeInsets.all(
        12.0,
      ),
      children: [
        Center(
          child: DotStepper(
            activeStep: activeIndex,
            dotRadius: 20.0,
            shape: Shape.pipe,
            spacing: 10.0,
          ),
        ),
        Text(
          "Step ${activeIndex + 1} من $totalIndex",
          style: const TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Name",
          ),
          validator: RequiredValidator(
            errorText: "Required *",
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {
              print("register");

            },
            child: const Text(
              "إنهاء",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
