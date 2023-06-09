import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_card/select_card.dart';
import 'Bar.dart';
import 'Compliments.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';
import 'package:http/http.dart' as http;

class GetCard extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  GetCard(
      {
        required this.Email,
        required this.Password,
        required this.username,
        required this.mobile,
        required this.Gender,
        required this.dob,
        required this.id,
        required this.Adress,
        required this.nationalid,
      }
      );

  @override
  State<GetCard> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<GetCard> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _MyAppState(
      {
        required this.Email,
        required this.Password,
        required this.username,
        required this.mobile,
        required this.Gender,
        required this.dob,
        required this.id,
        required this.Adress,
        required this.nationalid,
      }
      );

  final formkey = GlobalKey<FormState>();
  bool value = false;

  TextEditingController customername= TextEditingController();
  TextEditingController accnumber= TextEditingController();
  TextEditingController acc= TextEditingController();
  TextEditingController edatee= TextEditingController();
  TextEditingController cvvv= TextEditingController();

  String dropdown3 = 'Gold';
  var items3 = ['Gold', 'Credit', 'Debit'];
  String? cardGroupResult2;

  Future SendData() async {
    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/GetCard.php') ;

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnumber.text))));
    final enccus = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(customername.text))));
    final encedate = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(edatee.text))));
    final enccvv= base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(cvvv.text))));

    final response = await http.post(url, body:{
      "customername": customername.text,
      "accountnumber": encAcc,
      "edate": edatee.text,
      "cvv": cvvv.text,
      "cardtype":cardGroupResult2,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "bebo") {
      }
      else if (data == "Success") {
        accnumber.text="";
        customername.text="";
        edatee.text="";
        cvvv.text="";
        showAlertDialog(context, " Card created successfully");
      }
      if (data == "Already Exists") {
        showAlertDialog(context, " Already Applied for card");
      }
    }

    catch (e) {
      print(e);
    }
  }

  var data;
  var uname ;

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

  Future<void> getData(String accnum) async {
    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final decryptedaccnum =
    utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

    accountnum1 = decryptedaccnum;
    uname = data[0]["name"];
  }





  final Map<String, String> CardsMap = {
    'images/gold.jpeg': 'Gold',
    'images/credit.jpeg': "Credit",
    'images/debit.jpeg': "Debit",
  };

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  flexibleSpace:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                        child:
                        Row(
                            children: [
                              Image(image: AssetImage("images/logo3.jpeg"),height:150 ,),
                              SizedBox(
                                  width: 1300
                              ),
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Search(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid) ,));
                              },
                                  icon: Icon(Icons.person_search_rounded,color: Colors.white,size: 30,)),
                              SizedBox(
                                width: 10,
                              ),
                            ]
                        )
                    ),
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
                      PlutoMenuBarDemo(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(" Apply For Card ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    // awl line
                    Form(
                      key: formkey,
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Row(children: <Widget>[
                              SizedBox(
                                height: 50,
                                width: 80,
                              ),
                              Container(
                                child: Text(" Account Number :",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 30,
                                width: 300,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: accnumber,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[1-9][0-9]{15}$')
                                            .hasMatch(value!)) {
                                      return " account number Must be 16 number";
                                    }
                                    else
                                      return null;
                                  },
                                  cursorColor: Colors.black,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  onFieldSubmitted:(value) {
                                    getUserData(accnumber.text);
                                    getData(accnumber.text);
                                    customername.text = uname;
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
                                height: 50,
                              ),
                            ]),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 80,
                                ),
                                Container(
                                  child: Text(" Customer Name :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 250,
                                  child: TextFormField(
                                    controller: customername,
                                    textAlign: TextAlign.center,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-z]+$')
                                              .hasMatch(value!)) {
                                        return "please enter Correct name";
                                      } else
                                        return null;
                                    },
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3)),
                                      focusColor: Colors.black,
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            // Second Row
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 80,
                                ),
                                Container(
                                  child: Text(" End date :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 250,
                                  child: TextFormField(
                                    controller: edatee,
                                    textAlign: TextAlign.center,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[0-9][1-9]/(2)[0-9]$')
                                              .hasMatch(value!)) {
                                        return " Date format 00 / 2.";
                                      } else
                                        return null;
                                    },
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3)),
                                      focusColor: Colors.black,
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 80,
                                ),
                                Container(
                                  child: Text(" CVV :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 250,
                                  child: TextFormField(
                                    controller: cvvv,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[0-9][0-9]{2}$').hasMatch(value!)) {
                                        return "must be 3 number only ";
                                      } else
                                        return null;
                                    },
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3)),
                                      focusColor: Colors.black,
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            /*Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 80,
                                ),
                                Container(
                                  child: Text(" Card Type : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                DropdownButton(
                                  value: dropdown3,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
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
                            ),*/
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: SelectSlideItem(
                          mapList: CardsMap,
                          fontColor: Colors.black,
                          fontSize: 18,
                          text: "Card types : ",
                          hint: "Please select your Card types",
                          imageHeight: 350,
                          duration: const Duration(milliseconds: 900),
                          onChange: (title) {
                            debugPrint(title);
                            setState(() {
                              cardGroupResult2 = title;
                            });
                          }),
                    ),

                    // 5ames line
                    Row(children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(" Submit ",
                                      style: TextStyle(fontSize: 26)),
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
                                        borderRadius: BorderRadius.circular(40),
                                        side: BorderSide(
                                            color: Color(0xff8d0000))))),
                            onPressed: () {
                              /*if( accnumber.text == "" || edatee.text == "" || cvvv.text == "" || customername.text == "")
                                {
                                  showAlertDialog(context, "Fields mus'nt be empty");
                                }
                              else
                                {
                                  SendData();
                                }*/
                              if (formkey.currentState!.validate() && edatee.text != "" && customername.text != "") {
                                  SendData();
                            }
                              else
                                {
                                  showAlertDialog(context, " There are missing values ");
                                }
                             }
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(" Cancel ",
                                      style: TextStyle(fontSize: 26)),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff8d0000)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white54),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        side: BorderSide(
                                            color: Colors.white54)))),
                            onPressed: () {
                              accnumber.text="";
                              customername.text="";
                              edatee.text="";
                              cvvv.text="";
                            }),
                      )),
                    ])
                  ])
                ]))));
  }
}
void showAlertDialog( BuildContext context, var text) {
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
