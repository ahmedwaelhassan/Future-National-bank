import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled6/terms.dart';
import 'Bar.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class certificate extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  certificate(
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
  State<certificate> createState() => _certificateState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _certificateState extends State<certificate> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _certificateState(
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
  terms() {
    // TODO: implement faqscode
    throw UnimplementedError();
  }

  bool _swVal = false;

  void _onChange(bool val) {
    setState(() {
      _swVal = val;
    });
  }

  String dropdown = 'Platinum 3 years (Monthly 16%)';
  var items = [
    'Platinum 3 years (Monthly 16%)',
    'Platinum 3 years (Half yearly 16.5%)',
    'Platinum 3 years (Yearly 17.5%)'
  ];

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

  TextEditingController accountnumber = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  Random random = Random();

  Future SendData() async {

    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/cert.php');

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnumber.text))));

    int randomNumber = random.nextInt(900) + 100;

    var id = "${date1.year}${date1.month}${date1.day}$randomNumber".toString();
    var certdate = "${date1.year}-${date1.month}-${date1.day}".toString();

    final response = await http.post(url, body: {

      "accountnumber":encAcc,
      "certtype": dropdown,
      "certdate": certdate,
      "certamount": amount.text,
      "certid":id,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      } else if (data == "Success") {
        setState(() {
          amount.text = '';
          accountnumber.text = '';
          AlertDialog(
            content: Text('Applied Successfully '),
          );
        });
      }
      if (data == "Already Exists") {
      } 
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                                builder: (context) => Search(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
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
                     PlutoMenuBarDemo(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(" Apply for certificate",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Account number',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 550, right: 550, top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                            ),
                          ]),
                      child: TextField(
                        controller: accountnumber,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusColor: Colors.black,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                        thickness: 4, height: 40, endIndent: 100, indent: 100),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Select product',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          child: DropdownButton(
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
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                        thickness: 4, height: 40, endIndent: 100, indent: 100),
                    SizedBox(height: 10),
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 550, right: 550, top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                            ),
                          ]),
                      child: TextField(
                        controller: amount,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusColor: Colors.black,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                        thickness: 4, height: 40, endIndent: 100, indent: 100),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 15),
                          Text('Start date',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 135),
                          IconButton(
                              onPressed: () {
                                selectinDate(context);
                              },
                              icon: Icon(Icons.date_range)),
                          Text(
                            ('${date1.year} - ${date1.month} - ${date1.day}')
                                .toString(),
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                        thickness: 4, height: 40, endIndent: 100, indent: 100),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 20),
                          child: Text(
                              'I have read and agree to the terms\nof FNB services',
                              style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Switch(
                          value: _swVal,
                          onChanged: _onChange,
                          activeColor: Color(0xff8d0000),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      child: const Text(
                        'Show terms',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff8d0000)),
                      ),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: size.width * 0.2,
                        child: ClipRRect(
                          child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                                // color: Colors.deepOrange,
                                onPressed: () async {
                                  SendData();
                                },
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff8d0000)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          side: BorderSide(
                                              color: Color(0xff8d0000))),
                                    )),
                              )),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ]),
            )));
  }

}
