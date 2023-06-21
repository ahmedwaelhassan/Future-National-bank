import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/terms.dart';
import '../crypto/crypto.dart';
import 'Bar.dart';
import 'Search.dart';

class changepass extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  changepass({
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
  State<changepass> createState() => _changepassState(
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

class _changepassState extends State<changepass> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _changepassState({
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

  TextEditingController current1 = new TextEditingController();
  TextEditingController new1 = new TextEditingController();
  TextEditingController confirm = new TextEditingController();

  Future SendData() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/changepassdesktop.php');

    final response = await http.post(url, body: {
      "username": username,
      "Password": new1.text,
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      } else if (data == "Success") {
        setState(() {
          current1.text = '';
          new1.text = '';
          confirm.text = '';
        });
      }
      if (data == "Already Exists") {
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  bool ver = false;

  bool _isDarkMode = false;

  @override
  void initState() {
    _loadDarkMode();
    super.initState();
  }

  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(' My pass $Password');
    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }

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
              Row(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.only(left: 670, right: 500, top: 30),
                    child: Text(
                      'Current password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Container(
                margin: const EdgeInsets.only(left: 500, right: 500, top: 30),
                decoration: BoxDecoration(
                    color: _getColor(_isDarkMode),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                      ),
                    ]),
                child: TextField(
                  controller: current1,
                  // obscureText: true,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {});
                  },

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.only(left: 670, right: 650, top: 30),
                    child: Text('New password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 500, right: 500, top: 30, bottom: 30),
                decoration: BoxDecoration(
                    color: _getColor(_isDarkMode),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                      ),
                    ]),
                child: TextField(
                  controller: new1,
                  obscureText: true,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 500, right: 500),
                child: FlutterPwValidator(
                  controller: new1,
                  minLength: 8,
                  failureColor: Color(0xff8d0000),
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 280,
                  height: 120,
                  defaultColor: Color(0xff8d0000),
                  successColor: Colors.green,
                  onSuccess: () {
                    ver = true;
                  },
                  onFail: () {
                    ver = false;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 670, right: 650),
                    child: Text('Confirm password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Container(
                margin: const EdgeInsets.only(left: 500, right: 500, top: 30),
                decoration: BoxDecoration(
                    color: _getColor(_isDarkMode),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                      ),
                    ]),
                child: TextField(
                  controller: confirm,
                  obscureText: true,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 630, right: 650),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    child: ClipRRect(
                      child: SizedBox(
                          height: 50,
                          width: 60,
                          child: ElevatedButton(
                            // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                            // color: Colors.deepOrange,
                            onPressed: () async {
                              if (current1.text == Password &&
                                  new1.text == confirm.text &&
                                  new1.text != '' &&
                                  confirm.text != '' &&
                                  ver == true) {
                                SendData();
                                showAlertDialog1(
                                    context, " Password changed successfully ");
                              } else if (current1.text == '' ||
                                  new1.text == '' ||
                                  confirm.text == '') {
                                showAlertDialog1(
                                    context, " Please fill in the form! ");
                              } else if (current1.text != Password) {
                                showAlertDialog1(context,
                                    " The old password is not correct ");
                              } else {
                                showAlertDialog1(context,
                                    " Please check that you entered data correctly! ");
                              }
                            },
                            child: Text(
                              'Save changes',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff8d0000)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side:
                                          BorderSide(color: Color(0xff8d0000))),
                                )),
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
