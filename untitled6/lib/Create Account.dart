import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/home.dart';
import 'Bar.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';
import 'package:path/path.dart' as path;

class createaccount extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  createaccount({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  @override
  State<createaccount> createState() => _createaccounttate(
      Email: Email,
      Password: Password,
      username: username,
      mobile: mobile,
      Gender: Gender,
      dob: dob,
      id: id,
      Adress: Adress,
      nationalid: nationalid);
}
TextEditingController accountnumber = new TextEditingController();

class _createaccounttate extends State<createaccount> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _createaccounttate({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  final formkey = GlobalKey<FormState>();

  bool isChecked = false;
  String dropdown = 'Egyptian';
  var items = ['Egyptian', 'American', 'Emirati', 'Spanish'];
  String dropdown2 = 'Current';
  var items2 = ['Current', 'Saving'];
  String dropdown3 = 'EGP';
  var items3 = ['EGP', 'USD', 'SAR', 'KWD'];

  String dropdown4 = 'Single';
  var items4 = [
    'Single',
    'Married',
    'Divorced'
  ];


  bool value = false;
  TextEditingController cfn = new TextEditingController();
  TextEditingController dob1 = new TextEditingController();
  TextEditingController nat = new TextEditingController();
  TextEditingController marital = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController homephone = new TextEditingController();
  TextEditingController mohphone = new TextEditingController();
  TextEditingController job = new TextEditingController();
  TextEditingController jobadd = new TextEditingController();
  TextEditingController monthly = new TextEditingController();
  TextEditingController acctype = new TextEditingController();
  TextEditingController nationalid1 = new TextEditingController();
  TextEditingController balance = new TextEditingController();
  TextEditingController pass2 = new TextEditingController();
  String Genderr = "";

  String startdate = '';
  DateTime date1 = DateTime.now();
  var c="";

  Future<Null> selectinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
        c=date1.toString();
      });
    }
  }

  Future<void> delay(int milliseconds) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  }

  Future SendData() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/CreateAccountdesktop.php');

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnumber.text))));

    final response = await http.post(url, body: {
      "cfn": cfn.text,
      "mobnum": mohphone.text,
      "homenum": homephone.text,
      "dob": [date1.year,date1.month,date1.day].toString(),
      "Marital": dropdown4,
      "nat": dropdown,
      "address": address.text,
      "email": email.text,
      "job": job.text,
      "jobadd": jobadd.text,
      "monthly": monthly.text,
      "acctype": dropdown2,
      "nationalid": nationalid1.text,
      "accountnumber": encAcc,
      "gender": Genderr,
      "balance": balance.text,
      "money": dropdown3,
      "pass2": pass2.text,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {} else if (data == "Success") {
        setState(() {
          cfn.text = '';
          mohphone.text = '';
          homephone.text = '';
          dob1.text = '';
          marital.text = '';
          nat.text = '';
          address.text = '';
          email.text = '';
          job.text = '';
          jobadd.text = '';
          monthly.text = '';
          acctype.text = '';
          nationalid1.text = '';
          Genderr = '';
          balance.text = '';
          pass2.text = '';

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Signatureeee(
                          Email: Email,
                          Password: Password,
                          username: username,
                          mobile: mobile,
                          Gender: Gender,
                          dob: dob,
                          id: id,
                          Adress: Adress,
                          nationalid: nationalid)),
            );
        });
      }
      if (data == "Already Exists") {
        showAlertDialog(context, "Account number is already exists");
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Color(0xff8d0000);
    }

    TextEditingController dateinput = TextEditingController();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                        child: Row(children: [
                          Image(
                            image: AssetImage("images/logo3.jpeg"),
                            height: 150,
                          ),
                          SizedBox(width: 1300),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Search(
                                              Email: Email,
                                              Password: Password,
                                              username: username,
                                              mobile: mobile,
                                              Gender: Gender,
                                              dob: dob,
                                              id: id,
                                              Adress: Adress,
                                              nationalid: nationalid),
                                    ));
                              },
                              icon: Icon(
                                Icons.person_search_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ])),
                  ),
                  backgroundColor: Color(0xff8d0000),
                ),
                body: ListView(children: [
                  TabBar(
                    unselectedLabelColor: Color(0xff8d0000),
                    indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 5.0,
                            color: Color(0xff8d0000),
                          ),
                        )),
                    labelColor: Color(0xff8d0000),
                    labelPadding: EdgeInsets.only(right: 0, left: 0),
                    tabs: [
                      PlutoMenuBarDemo(
                          Email: Email,
                          Password: Password,
                          username: username,
                          mobile: mobile,
                          Gender: Gender,
                          dob: dob,
                          id: id,
                          Adress: Adress,
                          nationalid: nationalid),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(" Create Account ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: formkey,
                      child: Container(
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            // Second Row
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                  width: 50,
                                ),
                                Container(
                                  child: Text(" Customer Full Name : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 300,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: cfn,
                                    cursorColor: Colors.black,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-z]+$')
                                              .hasMatch(value!)) {
                                        return "please enter Correct name";
                                      } else
                                        return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle: TextStyle(
                                          color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            // third row
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: <Widget>[
                              SizedBox(
                                height: 40,
                                width: 50,
                              ),
                              Container(
                                child: Text(" Date Of Birth : ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    selectinDate(context);
                                  },
                                  icon: Icon(Icons.date_range)),
                              Text(
                                ('${date1.year} - ${date1.month} - ${date1.day}')
                                    .toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Text(" Nationality : ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              DropdownButton(
                                value: dropdown,
                                borderRadius: BorderRadius.circular(15),
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    dropdown = newvalue!;
                                  });
                                },
                              ),
                            ]),

                            SizedBox(
                              height: 10,
                            ),

                            // rabe33 line
                            Container(
                                child: Column(children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Gender : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RadioButtonGroup(
                                          activeColor: Color(0xff8d0000),
                                          labels: <String>[
                                            " Male ",
                                            " Female "
                                          ],
                                          orientation:
                                          GroupedButtonsOrientation.HORIZONTAL,
                                          onSelected: (var selected) {
                                            setState(() {
                                              Genderr = selected;
                                            });
                                          }),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Marital Status : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton(
                                        value: dropdown4,
                                        borderRadius: BorderRadius.circular(15),
                                        icon: const Icon(Icons.arrow_drop_down_sharp),
                                        items: items4.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            dropdown4 = newvalue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // sades line
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Address : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 300,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter Value";
                                            } else
                                              return null;
                                          },
                                          controller: address,
                                          cursorColor: Colors.black,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(" Email Address : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 300,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          controller: email,
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(
                                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                    .hasMatch(value!)) {
                                              return "please enter Correct Email";
                                            } else
                                              return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  // sabe3 line

                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 40,
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Home Phone Number : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 200,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          controller: homephone,
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(
                                                    r'^(\+\d{1}[- ]?)?\d{10}$')
                                                    .hasMatch(value!)) {
                                              return "please enter Correct Home number";
                                            } else
                                              return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(" Mobile Number : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 200,
                                        child: TextFormField(
                                          controller: mohphone,
                                          textAlign: TextAlign.center,
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(
                                                    r'^(\+\d{1,3}[- ]?)?\d{11}$')
                                                    .hasMatch(value!)) {
                                              return "please enter Correct Mobile number";
                                            } else
                                              return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  // tammeen line

                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 40,
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Job : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 200,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter Value";
                                            } else
                                              return null;
                                          },
                                          controller: job,
                                          cursorColor: Colors.black,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(" Job Address : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 250,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter Value";
                                            } else
                                              return null;
                                          },
                                          controller: jobadd,
                                          cursorColor: Colors.black,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 5)),
                                            focusColor: Colors.black,
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" Monthly Income : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[0-9]{1,6}$')
                                                  .hasMatch(value!)) {
                                            return "please enter Correct value";
                                          } else
                                            return null;
                                        },
                                        controller: monthly,
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  // 11 line

                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" Account Type : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    DropdownButton(
                                      value: dropdown2,
                                      borderRadius: BorderRadius.circular(15),
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp),
                                      items: items2.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newvalue) {
                                        setState(() {
                                          dropdown2 = newvalue!;
                                        });
                                      },
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" National Id : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[1-9][0-9]{13}$')
                                                  .hasMatch(value!)) {
                                            return "must be 14 number only ";
                                          } else
                                            return null;
                                        },
                                        controller: nationalid1,
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" Password 2 : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: pass2,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[0-9][0-9]{3}$')
                                                  .hasMatch(value!)) {
                                            return "must be 4 number only ";
                                          } else
                                            return null;
                                        },
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" Balance : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[1-9][0-9]{1,4}$')
                                                  .hasMatch(value!)) {
                                            return " Your max balance is 10,000 ";
                                          } else
                                            return null;
                                        },
                                        controller: balance,
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    DropdownButton(
                                      value: dropdown3,
                                      borderRadius: BorderRadius.circular(15),
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp),
                                      items: items3.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newvalue) {
                                        setState(() {
                                          dropdown3 = newvalue!;
                                        });
                                      },
                                    ),
                                  ]),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  // 13 line

                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(" Account Number : ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[1-9][0-9]{15}$')
                                                  .hasMatch(value!)) {
                                            return "Please enter Value Must be 16 number";
                                          } else
                                            return null;
                                        },
                                        controller: accountnumber,
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(
                                              color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(
                                          " * I have verified all the required information and agree to open the account ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff8d0000),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                      MaterialStateProperty.resolveWith(
                                          getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    )
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[
                                        Center(
                                            child: Column(children: <Widget>[
                                              Container(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (formkey.currentState!
                                                        .validate()) {
                                                      if (isChecked == true) {
                                                        SendData();
                                                      } else {
                                                        showAlertDialog(context,
                                                            " Must Check required information box");
                                                      }
                                                    }
                                                  },
                                                  child: Text('Create',
                                                      style: TextStyle(
                                                        color: Color(
                                                            0xff8d0000),
                                                        fontSize: 18,
                                                      ),
                                                      textAlign: TextAlign
                                                          .center),
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        50, 20, 50, 20),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                        side: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            width: 1,
                                                            color: Color(
                                                                0xff8d0000))),
                                                    primary: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ]))
                                      ]),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ]))
                          ])),
                    )
                  ])
                ]))));
  }
  void showAlertDialog(BuildContext context, var text) {
    var alertDialog = AlertDialog(
      content: Text(
        text,
        style: TextStyle(color: Color(0xff8d0000), fontSize: 30),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Ok',
            ),
            style: ButtonStyle(
              iconSize: MaterialStatePropertyAll(20),
              backgroundColor: MaterialStatePropertyAll(Color(0xff8d0000)),
            )),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
class Signatureeee extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  Signatureeee({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  @override
  State<Signatureeee> createState() => _MyHomePageState(
      Email: Email,
      Password: Password,
      username: username,
      mobile: mobile,
      Gender: Gender,
      dob: dob,
      id: id,
      Adress: Adress,
      nationalid: nationalid);
}

var pic;

class _MyHomePageState extends State<Signatureeee> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _MyHomePageState({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  Uint8List? exportedImage;
  SignatureController controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white70,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Container(
              child: Row(children: [
            SizedBox(
              width: 50,
            ),
            Image(
              image: AssetImage("images/logo3.jpeg"),
              height: 150,
            ),
                SizedBox(width: 500),
            Text("Signature",style: TextStyle(fontSize: 32,color: Colors.white),),
            SizedBox(width: 600),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(
                            Email: Email,
                            Password: Password,
                            username: username,
                            mobile: mobile,
                            Gender: Gender,
                            dob: dob,
                            id: id,
                            Adress: Adress,
                            nationalid: nationalid),
                      ));
                },
                icon: Icon(
                  Icons.person_search_rounded,
                  color: Colors.white,
                  size: 30,
                )),
            SizedBox(
              width: 10,
            ),
          ])),
        ),
        backgroundColor: Color(0xff8d0000),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Signature(
              controller: controller,
              width: 500,
              height: 300,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          exportedImage = await controller.toPngBytes();
                          pic = exportedImage;
                          print(pic);
                          //API
                          setState(() {});
                        },
                        child: const Text(
                          "Show",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))))),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.clear();
                        },
                        child: const Text(
                          "Clear",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.white70)))))),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () async {
                          exportedImage = await controller.toPngBytes();
                          pic = exportedImage;
                          print(pic);
                          // Save the image to a file
                          final fileName = accountnumber.text.isNotEmpty ? accountnumber.text : 'signature';
                           saveImage(exportedImage!, fileName);

                          showAlertDialog(context, "Account Created successfully");

                          //API
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => home(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid
                            ),));
                            accountnumber.text="";
                          });
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.white70)))))),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (exportedImage != null)
              Image.memory(
                exportedImage!,
                width: 700,
                height: 250,
              ),
          ],
        ),
      ),
    );
  }
  void saveImage(List<int> imageData, String fileName) async {
    final directory = Directory('C:\\Users\\green\\StudioProjects\\untitled6\\signature'); // Change this to the directory where you want to save the image
    final filePath = path.join(directory.path, '${accountnumber.text}.png');
    final file = File(filePath);
    await file.writeAsBytes(imageData);
    print('Image saved to: $filePath');
  }
  void showAlertDialog(BuildContext context, var text) {
    var alertDialog = AlertDialog(
      content: Text(
        text,
        style: TextStyle(color: Color(0xff8d0000), fontSize: 30),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Ok',
            ),
            style: ButtonStyle(
              iconSize: MaterialStatePropertyAll(20),
              backgroundColor: MaterialStatePropertyAll(Color(0xff8d0000)),
            )),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}


/*Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        child: Text(" Signature : ",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signatureeee(
                                                        Email: Email,
                                                        Password: Password,
                                                        username: username,
                                                        mobile: mobile,
                                                        Gender: Gender,
                                                        dob: dob,
                                                        id: id,
                                                        Adress: Adress,
                                                        nationalid: nationalid)),
                                          );
                                        },
                                        icon: Icon(Icons.paste_outlined),
                                        iconSize: 30,
                                      )
                                    ],
                                  ),*/