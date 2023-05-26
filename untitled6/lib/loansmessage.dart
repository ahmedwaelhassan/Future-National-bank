import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';
import 'package:http/http.dart'as http;

class lmessage extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  lmessage(
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
  State<lmessage> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<lmessage> {
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

  TextEditingController usernamee=TextEditingController();
  TextEditingController mobilee=TextEditingController();

  var mobileee;
  var usernameee;
  var data;
  var emailadd;
  var accccnumm;

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

    accccnumm =decryptedaccnum;
    usernameee = data[0]["name"];
    mobileee = data[0]["mobilenumber"];
  }

  TextEditingController accnumm=TextEditingController();

  var messages;
  var type;
  var accnum;

  Future SendData() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/messages.php');

    final response = await http.post(url, body: {
      "accountnumber": accnumm.text,
      "message": dropdown,
      "type": 'Loan',

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      } else if (data == "Success") {
        showAlertDialog(context," Message has been sent successfully ");
      }
    } catch (e) {
      print(e);
    }
  }

  // hanin

  void sendSms() async {
    String accountSid = 'AC29adea0d1b73d261d1788185df59d77d';
    String authToken = '99e04fa03c2dd938fe732588babfdfcc';
    String fromNumber = '+12705141944';
    String toNumber = mobilee.text;
    String message = dropdown;
    String uri = 'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

    var response = await http.post(Uri.parse(uri),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      },
      body: {
        'From': fromNumber,
        'To': toNumber,
        'Body': message,
      },
    );

    if (response.statusCode == 201) {
      print('SMS message sent successfully!');
    } else {
      print('Failed to send SMS message. ${response.body}');
    }
  }

  bool isChecked = false;
  String dropdown ='Need funds for a big purchase or unexpected expense? We can help! Contact us today to learn about our loan options.';
  var items = ['Need funds for a big purchase or unexpected expense? We can help! Contact us today to learn about our loan options.',
    'Looking to start a new business or expand your current one? We offer business loans to help you achieve your goals.',
    'Need a personal loan for a home renovation or vacation? We have flexible loan options to fit your needs.',
    'We understand that unexpected expenses can arise. Our loan options can help you get the funds you need, when you need them.',
    'Our loan experts are here to help you navigate the lending process and find the right loan for your needs.',
    'Want to consolidate your debt or improve your credit score? Our loan options can help you get on the path to financial stability.'
  ];

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
                body: Center(
                    child: ListView(children: [
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
                    height: 30,
                  ),
                  Center(
                      child: Column(children: [
                    Center(
                      child: Text(" Loan messages ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          child: Text(
                            " Account Number : ",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: TextField(
                              controller: accnumm,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              onSubmitted: (value) {
                                getUserData(accnumm.text);
                                getData(accnumm.text);
                              setState(() {
                                usernamee.text=usernameee;
                                mobilee.text=mobileee;
                              });
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
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            " Username : ",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: TextField(
                              controller: usernamee,
                              cursorColor: Colors.black,
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
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            " Mobile number : ",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: TextField(
                              controller: mobilee,
                              cursorColor: Colors.black,
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
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Container(
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
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Text(
                                    " Send message to All ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              )
                            ],mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 40),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                SendData();
                                sendSms();
                              },
                              child: Text('Send',
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
                          )
                        ])
                  ]))
                ])))));
  }
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