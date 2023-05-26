import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:untitled6/Bar.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';

class Deposit extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  Deposit({
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
  State<Deposit> createState() => _MyAppState(
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

String dropdown3 = 'EGP';
var items3 = ['EGP', 'USD', 'SAR', 'KWD'];

TextEditingController accnum = new TextEditingController();
TextEditingController balance = new TextEditingController();
TextEditingController Depostmoney = new TextEditingController();
TextEditingController newbalance = new TextEditingController();
TextEditingController nationalid1 = new TextEditingController();
TextEditingController mohphone = new TextEditingController();
TextEditingController cfn12 = new TextEditingController();

var c;

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

var h;

Future SendData2deposit(var date, var time) async {

  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/transactions.php');

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum.text))));
  final enctoo = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum.text))));
  final encamount = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(Depostmoney.text))));
  final encdate = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(date))));
  final enctime = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(time))));
  final encrbalance = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(c.toString()))));
  final enctype = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode('Deposit'))));

  final response = await http.post(url, body: {

    "accountnumber": encAcc,
    "tooo": enctoo,
    "type": enctype,
    "amount": encamount,
    "date1": encdate,
    "time1": enctime,
    "rbalance": encrbalance,


  });
  try {
    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
    } else if (data == "Success") {
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}

Future SendData2withdraw(var date, var time) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/transactions.php');

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum.text))));
  final enctoo = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum.text))));
  final encamount = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(Depostmoney.text))));
  final encdate = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(date))));
  final enctime = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(time))));
  final encrbalance = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(c.toString()))));
  final enctype = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode('Withdraw'))));

  final response = await http.post(url, body: {
    "accountnumber": encAcc,
    "tooo": enctoo,
    "type": enctype,
    "amount": encamount,
    "date1": encdate,
    "time1": enctime,
    "rbalance": encrbalance,
  });
  try {
    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
    } else if (data == "Success") {
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}

Future Updatedata(var accnum1) async {

  var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/Deposit.php');
  print(accnum1.toString());
  print(c.toString());

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum1))));

  final response = await http.post(url, body: {
    "accnum": encAcc,
    "balance": c.toString(),
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

var accountnum1;
var data;
var balance1;
var money;
var name1;
var mobilenum;
var id1;

Future getUserData(String accnum) async {
  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/Searchdesktop.php');

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);

  final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum))));

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

Future<void> getData(String accnum) async {

  final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
  final aes = Aes(key);
  final decryptedaccnum = utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

  accountnum1 =decryptedaccnum;

  balance1 = data[0]["balance"];
  money = data[0]["money"];
  name1 = data[0]["name"];
  mobilenum = data[0]["mobilenumber"];
  id1 = data[0]["nationalid"];
}

class _MyAppState extends State<Deposit> {
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

  bool isDarkModeEnabled = false;
  bool deposit = false;
  bool withdraw = false;
  bool _isreadonly = true;

  @override
  Widget build(BuildContext context) {
    var date = "${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time = "${time1.hour} - ${time1.minute}".toString();
    print(date);
    print(time);

    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.green)),
          appBarTheme: AppBarTheme(color: const Color(0xff8d0000)),
          scaffoldBackgroundColor: const Color(0xFF15202B),
        ),
        themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
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
              body: ListView(
                children: [
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
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            width: 15,
                          ),
                          Row(children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text(" Account Number :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 40,
                              width: 200,
                              child: TextField(
                                controller: accnum,
                                cursorColor: Colors.black,
                                onSubmitted: (value) {
                                  getUserData(accnum.text);
                                  getData(accnum.text);
                                  balance.text = balance1;
                                  dropdown3 = money;
                                  mohphone.text = mobilenum;
                                  nationalid1.text = id1;
                                  cfn12.text = name1;
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Text(" Customer Full Name : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 200,
                            child: TextField(
                              readOnly: _isreadonly,
                              controller: cfn12,
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
                            width: 15,
                          ),
                          Container(
                            child: Text(" Phone number : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 5,
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
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Text(" National Id : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 5,
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
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Visibility(
                          visible: deposit,
                          child: Column(children: [
                            Text(" Deposit Money ",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 400, right: 400),
                                child: ElevatedButton(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(" Account Balance ",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        Container(
                                          child: Text(
                                              "-------------------------------------------------------------------------"),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: SizedBox(
                                                height: 40,
                                                width: 100,
                                                child: TextField(
                                                  readOnly: true,
                                                  controller: balance,
                                                  cursorColor: Colors.white,
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            DropdownButton(
                                              value: dropdown3,
                                              dropdownColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff8d0000)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                side: BorderSide(
                                                    color:
                                                        Color(0xff8d0000))))),
                                    onPressed: () => null),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              Row(children: [
                                SizedBox(
                                  width: 500,
                                ),
                                Container(
                                  child: Text(" Deposit :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: TextField(
                                    controller: Depostmoney,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ElevatedButton(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(" Depsoit ",
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff8d0000)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              side: BorderSide(
                                                  color: Color(0xff8d0000))))),
                                  onPressed: () async {
                                    if (int.parse(Depostmoney.text) > 10000) {
                                      showAlertDialog(context,
                                          " Your maximum daily deposit amount is 10,000 ");
                                    } else {
                                      c = int.parse(balance1) +
                                          int.parse(Depostmoney.text);
                                      print(c);
                                      newbalance.text = c.toString();
                                      await Updatedata(accnum.text);
                                      await SendData2deposit(date, time);
                                      setState(() {
                                        Depostmoney.text = "";
                                        balance.text = "";
                                        newbalance.text = "";
                                      });
                                    }
                                  },
                                ),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: ElevatedButton(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(" New Balance ",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        Container(
                                          child: Text(
                                              "--------------------------------------------------------------------"),
                                        ),
                                        Container(
                                          child: SizedBox(
                                            height: 50,
                                            width: 150,
                                            child: TextField(
                                              readOnly: true,
                                              controller: newbalance,
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff8d0000)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                side: BorderSide(
                                                    color:
                                                        Color(0xff8d0000))))),
                                    onPressed: () => null),
                              )),
                            ])
                          ])),
                      Visibility(
                          visible: withdraw,
                          child: Column(children: [
                            Center(
                              child: Text(" Withdraw Money ",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 400, right: 400),
                                child: ElevatedButton(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(" Account Balance ",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        Container(
                                          child: Text(
                                              "-------------------------------------------------------------------------"),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: SizedBox(
                                                height: 40,
                                                width: 100,
                                                child: TextField(
                                                  readOnly: true,
                                                  controller: balance,
                                                  cursorColor: Colors.white,
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            DropdownButton(
                                              value: dropdown3,
                                              dropdownColor: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
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
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff8d0000)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                side: BorderSide(
                                                    color:
                                                        Color(0xff8d0000))))),
                                    onPressed: () => null),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              Row(children: [
                                SizedBox(
                                  width: 500,
                                ),
                                Container(
                                  child: Text(" Withdraw :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: TextField(
                                    controller: Depostmoney,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusColor: Colors.black,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ElevatedButton(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(" Withdraw ",
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff8d0000)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              side: BorderSide(
                                                  color: Color(0xff8d0000))))),
                                  onPressed: () async {
                                    if (int.parse(Depostmoney.text) < 0) {
                                      showAlertDialog(context, " Wrong Input ");
                                    } else if (int.parse(Depostmoney.text) >
                                        int.parse(balance.text)) {
                                      showAlertDialog(context,
                                          "Your Account balance isn't enough");
                                    } else {
                                      c = int.parse(balance1) -
                                          int.parse(Depostmoney.text);
                                      print(c);
                                      newbalance.text = c.toString();
                                      await Updatedata(accnum.text);
                                      await SendData2withdraw(date, time);
                                      setState(() {
                                        Depostmoney.text = "";
                                        balance.text = "";
                                        newbalance.text = "";
                                      });
                                    }
                                  },
                                ),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: ElevatedButton(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(" New Balance ",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        Container(
                                          child: Text(
                                              "--------------------------------------------------------------------"),
                                        ),
                                        Container(
                                          child: SizedBox(
                                            height: 50,
                                            width: 150,
                                            child: TextField(
                                              readOnly: true,
                                              controller: newbalance,
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelStyle: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff8d0000)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                side: BorderSide(
                                                    color:
                                                        Color(0xff8d0000))))),
                                    onPressed: () => null),
                              )),
                            ])
                          ])),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
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
                            onPressed: () {
                              setState(
                                () {
                                  deposit = !deposit;
                                },
                              );
                            },
                            child: Text(
                              deposit ? 'Hide' : 'Deposit',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
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
                            onPressed: () {
                              setState(
                                () {
                                  withdraw = !withdraw;
                                },
                              );
                            },
                            child: Text(
                              withdraw ? 'Hide' : 'Witdraw',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
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
