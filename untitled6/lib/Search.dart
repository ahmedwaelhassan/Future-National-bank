import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/terms.dart';
import 'Crypto/crypto.dart';
import 'package:signature/signature.dart';
import 'package:untitled6/home.dart';
import 'package:path/path.dart' as path;
import 'dart:developer';

void performHotReload() {
  log('Performing hot reload');
  window.scheduleFrame();
}

class Search extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  Search({
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
  State<Search> createState() => _MyAppState(
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

bool value = false;
String dropdown = 'Egyptian';
var items = ['Egyptian', 'American', 'Emirati', 'Spanish'];
String dropdown2 = 'Current';
var items2 = ['Current', 'Saving'];
String dropdown3 = 'EGP';
var items3 = ['EGP', 'USD', 'SAR', 'KWD'];

bool _isreadonly = true;
TextEditingController search = new TextEditingController();
TextEditingController cfn = new TextEditingController();
TextEditingController dob11 = new TextEditingController();
TextEditingController nat = new TextEditingController();
TextEditingController marital = new TextEditingController();
TextEditingController address = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController homephone = new TextEditingController();
TextEditingController mohphone = new TextEditingController();
TextEditingController job = new TextEditingController();
TextEditingController addresss = new TextEditingController();
TextEditingController monthly = new TextEditingController();
TextEditingController acctype = new TextEditingController();
TextEditingController nationalid1 = new TextEditingController();
TextEditingController accnum = new TextEditingController();
TextEditingController balance = new TextEditingController();
TextEditingController genderr = new TextEditingController();
String Genderr = "";

Future SendData() async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/searchdesktop.php');

  final response = await http.post(url, body: {
    "search": search.text,
    "cfn": cfn.text,
    "mobnum": mohphone.text,
    "homenum": homephone.text,
    "dob": dob11.text,
    "Marital": marital.text,
    "nat": dropdown,
    "address": address.text,
    "email": email.text,
    "job": job.text,
    "jobadd": addresss.text,
    "monthly": monthly.text,
    "acctype": dropdown2,
    "nationalid": nationalid1.text,
    "accnum": accnum.text,
    "gender": Genderr,
    "balance": balance.text,
    "Money": dropdown3,
  });
  try {
    var data = json.decode(response.body);

    print(data);
    if (data == "Error") {
    } else if (data == "Success") {}
    if (data == "Already Exists") {
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}

var name;
var dob1;
var nationality;
var gender;
var mart;
var add;
var emailadd;
var homenum;
var mobilenum;
var jobb;
var jobbadd;
var income;
var type;
var id1;
var accountnum1;
var data;
var balance1;
var money;

Future getUserData(String accnum) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/Searchdesktop.php');

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc =
      base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum))));

  var response = await http.post(url, body: {
    "accountnumber": encAcc,
  });

  // print(json.decode(response.body));
  var data1 = await json.decode(response.body);
  print(data1);
  data = data1;
  return data1;
  // return json.decode(response.body);
}

String bookdate = '';
DateTime date1 = DateTime.now();

Future<Null> selectinDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: date1,
    firstDate: DateTime(1960),
    lastDate: DateTime(2040),
  );
  if (picked != null && picked != date1) {
    date1 = picked;
    print(date1.toString());
  }
}

TimeOfDay time1 = TimeOfDay.now();

Future<Null> selectTime(BuildContext context) async {
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
  final TimeOfDay? tpicked = await showTimePicker(
    context: context,
    initialTime: time1,
    initialEntryMode: initialEntryMode,
  );
  time1 = tpicked!;
  print(time1.toString());
}

Future<void> getData(String accnum) async {
  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);
  final decryptedaccnum =
      utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

  name = data[0]["name"];
  dob1 = data[0]["dob"];
  nationality = data[0]["nationality"];
  gender = data[0]["gender"];
  mart = data[0]["maritalstatus"];
  add = data[0]["address"];
  emailadd = data[0]["email"];
  homenum = data[0]["homenumber"];
  mobilenum = data[0]["mobilenumber"];
  jobb = data[0]["job"];
  jobbadd = data[0]["jobaddress"];
  income = data[0]["monthlyicome"];
  type = data[0]["accounttype"];
  id1 = data[0]["nationalid"];
  accountnum1 = decryptedaccnum;
  balance1 = data[0]["balance"];
  money = data[0]["money"];
}

Future Delete(String accnum) async {
  var url =
      Uri.parse('https://inconspicuous-pairs.000webhostapp.com/delete.php');

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc =
      base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum))));

  var response = await http.post(url, body: {
    "accountnumber": encAcc,
  });

  // print(json.decode(response.body));
  var data1 = await json.decode(response.body);
  print(data1);
  data = data1;
  return data1;
  // return json.decode(response.body);
}

Future<void> delete(String accnum) async {
  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);
  final decryptedaccnum =
      utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

  name = data[0]["name"];
  dob1 = data[0]["dob"];
  nationality = data[0]["nationality"];
  gender = data[0]["gender"];
  mart = data[0]["maritalstatus"];
  add = data[0]["address"];
  emailadd = data[0]["email"];
  homenum = data[0]["homenumber"];
  mobilenum = data[0]["mobilenumber"];
  jobb = data[0]["job"];
  jobbadd = data[0]["jobaddress"];
  income = data[0]["monthlyicome"];
  type = data[0]["accounttype"];
  id1 = data[0]["nationalid"];
  accountnum1 = decryptedaccnum;
  balance1 = data[0]["balance"];
  money = data[0]["money"];
}

Future Updatedata(var accnum) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/updatecustomer.php');
  print(accnum);

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc =
      base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum))));

  final response = await http.post(url, body: {
    "accountnumber": encAcc,
    "name": cfn.text,
    "mobilenumber": mohphone.text,
    "homenumber": homephone.text,
    "dob": dob11.text,
    "maritalstatus": marital.text,
    "address": address.text,
    "email": email.text,
    "job": job.text,
    "jobaddress": addresss.text,
    "monthlyicome": monthly.text,
  });
  try {
    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
      print("mansour");
    } else if (data == "Success") {
      print("bebo");
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}

class _MyAppState extends State<Search> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _MyAppState({
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
  Widget build(BuildContext context) {
    var date = "${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time = "${time1.hour} - ${time1.minute}".toString();
    print(date);
    print(time);

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
                          SizedBox(width: 1250),
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
                          IconButton(
                              onPressed: () {
                                performHotReload();
                              },
                              icon: Icon(
                                Icons.restart_alt_rounded,
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
                    height: 5,
                  ),
                  Center(
                    child: Text(" Search For Accounts ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(children: [
                    // Search BAR
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(400, 7, 400, 5),
                              child: TextField(
                                onSubmitted: (value) {
                                  setState(() {
                                    getUserData(search.text);
                                    getData(search.text);
                                    cfn.text = name;
                                    dob11.text = dob1;
                                    dropdown = nationality;
                                    marital.text = mart;
                                    address.text = add;
                                    email.text = emailadd;
                                    homephone.text = homenum;
                                    mohphone.text = mobilenum;
                                    job.text = jobb;
                                    addresss.text = jobbadd;
                                    monthly.text = income;
                                    dropdown2 = type;
                                    nationalid1.text = id1;
                                    accnum.text = accountnum1;
                                    genderr.text = gender;
                                    balance.text = balance1;
                                    dropdown3 = money;
                                  });
                                },
                                controller: search,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ' Search Bar ',
                                    hintText:
                                        " Enter Customer's Account Number"),
                              ),
                            ),
                            Text(
                                "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
                          ])),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Column(children: [
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
                            child: TextField(
                              readOnly: _isreadonly,
                              controller: cfn,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5)),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.black),
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
                        SizedBox(
                            height: 30,
                            width: 200,
                            child: TextField(
                                readOnly: _isreadonly,
                                controller: dob11,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 16))),
                        SizedBox(
                          width: 50,
                        ),
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
                          /*onChanged: (value) {},*/
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
                            SizedBox(
                                height: 30,
                                width: 200,
                                child: TextField(
                                    readOnly: _isreadonly,
                                    controller: genderr,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16))),
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
                            SizedBox(
                                height: 30,
                                width: 200,
                                child: TextField(
                                    readOnly: _isreadonly,
                                    controller: marital,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 5)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16)))
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: address,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: email,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: homephone,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: mohphone,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: job,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                              child: TextField(
                                readOnly: _isreadonly,
                                controller: addresss,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
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
                            child: TextField(
                              readOnly: _isreadonly,
                              controller: monthly,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5)),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.black),
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
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            items: items2.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            /*  onChanged: (value) {
                            },*/
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
                            child: TextField(
                              readOnly: true,
                              controller: nationalid1,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5)),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.black),
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
                            child: TextField(
                              readOnly: true,
                              controller: balance,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5)),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.black),
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
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            items: items3.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            /* onChanged: (value) {

                           },*/
                            onChanged: (String? newvalue) {
                              setState(() {
                                dropdown3 = newvalue!;
                              });
                            },
                          ),
                        ]),

                        // 13 line
                        SizedBox(
                          height: 20,
                        ),

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
                            child: TextField(
                              readOnly: true,
                              controller: accnum,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5)),
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
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
                                        builder: (context) => ImageFolderScreen(
                                            Email: Email,
                                            Password: Password,
                                            username: username,
                                            mobile: mobile,
                                            Gender: Gender,
                                            dob: dob,
                                            id: id,
                                            Adress: Adress,
                                            nationalid: nationalid)));
                              },
                              icon: Icon(Icons.paste_outlined),
                              iconSize: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isreadonly = false;
                                  });
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1,
                                          color: Colors.black)),
                                  primary: Color(0xff8d0000),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isreadonly = true;
                                  });
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.fromLTRB(50, 20, 50, 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 1,
                                            color: Colors.black)),
                                    primary: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: Column(children: <Widget>[
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Delete(accnum.text);
                                    delete(accnum.text);
                                    setState(() {
                                      cfn.text = '';
                                      mohphone.text = '';
                                      homephone.text = '';
                                      dob11.text = '';
                                      marital.text = '';
                                      nat.text = '';
                                      address.text = '';
                                      email.text = '';
                                      job.text = '';
                                      addresss.text = '';
                                      monthly.text = '';
                                      acctype.text = '';
                                      nationalid1.text = '';
                                      accnum.text = '';
                                      Genderr = '';
                                      genderr.text = "";
                                      balance.text = '';
                                      balance.text = '';
                                      showAlertDialog(
                                          context, "Account has been Deleted");
                                    });
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.fromLTRB(50, 20, 50, 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 1,
                                            color: Colors.black)),
                                    primary: Color(0xff8d0000),
                                  ),
                                ),
                              )
                            ])),
                            SizedBox(width: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Updatedata(search.text);
                                  setState(() {
                                    _isreadonly = true;
                                    showAlertDialog(context,
                                        "Account has been Updated Successfully");
                                  });
                                },
                                child: Text('Update',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1,
                                          color: Colors.black)),
                                  primary: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ]))
                    ]))
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

class ImageFolderScreen extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  ImageFolderScreen({
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
  _ImageFolderScreenState createState() => _ImageFolderScreenState(
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

class _ImageFolderScreenState extends State<ImageFolderScreen> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _ImageFolderScreenState({
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

  List<File> _images = [];

  void _getImages() {
    String folderPath =
        'C:\\Users\\green\\StudioProjects\\untitled6\\signature'; // replace with the path to your image folder
    String imageName = search.text;

    // Find all files in folder with matching name
    Directory(folderPath).listSync().forEach((item) {
      if (item is File &&
          item.path.toLowerCase().endsWith('.png') &&
          item.path.toLowerCase().contains(imageName.toLowerCase())) {
        _images.add(item);
      }
    });

    setState(() {});
  }

  Future<void> deleteImage(String folderPath, String imageName) async {
    final allowedExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
    // Check if the file is an image file
    final extension =
        imageName.toLowerCase().substring(imageName.lastIndexOf('.'));
    if (!allowedExtensions.contains(extension)) {
      print('$imageName is not an image file.');
      return;
    }
    final file = File('$folderPath/$imageName');
    try {
      if (await file.exists()) {
        await file.delete();
        print('$imageName has been deleted from $folderPath.');
      } else {
        print('$imageName does not exist in $folderPath.');
      }
    } catch (e) {
      print('Error deleting $imageName: $e');
    }
  }

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
            SizedBox(width: 455),
            Text(
              " Signature Image",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )
          ])),
        ),
        backgroundColor: Color(0xff8d0000),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 50, top: 50),
            child: ElevatedButton(
              onPressed: _getImages,
              child: Text(
                ' Show signature ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                        style: BorderStyle.solid,
                        width: 1,
                        color: Colors.black)),
                primary: Color(0xff8d0000),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              children: _images.map((image) => Image.file(image)).toList(),
            ),
          ),
          Row(
            children: [
              /*Container(
                child: ElevatedButton(
                  onPressed: () {
                    deleteImage('C:\\Users\\green\\StudioProjects\\untitled6\\signature', '${search.text}.png');
                    showAlertDialog1(context, " Signature has been deleted ");
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.fromLTRB(50, 20, 50, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.black)),
                    primary: Color(0xff8d0000),
                  ),
                ),
              ),*/
              /*SizedBox(
                width: 25,
              ),*/
              ElevatedButton(
                onPressed: () {
                  deleteImage(
                      'C:\\Users\\green\\StudioProjects\\untitled6\\signature',
                      '${search.text}.png');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signatureeee(
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
                child: Text('Update',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.black)),
                  primary: Colors.white70,
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
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
            Text(
              "Signature",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
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
                          final fileName = search.text.isNotEmpty
                              ? search.text
                              : 'signature';
                          saveImage(exportedImage!, fileName);

                          showAlertDialog1(
                              context, " Signature has been updated ");

                          //API
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => home(
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
    final directory = Directory(
        'C:\\Users\\green\\StudioProjects\\untitled6\\signature'); // Change this to the directory where you want to save the image
    final filePath = path.join(directory.path, '${search.text}.png');
    final file = File(filePath);
    await file.writeAsBytes(imageData);
    print('Image saved to: $filePath');
  }
}
