import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';
import 'package:http/http.dart ' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  static String username = "bebo";
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String Email="";
  String Password ="";
  String username="";
  String mobile="";
  String Gender="";
  String dob="";
  String id="";
  String Adress="";
  String nationalid="";
  var data;

  Future getUserData(String accnum) async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/employeeview.php');
    var response = await http.post(url, body: {
      "username": accnum,
    });
    var data1 = await json.decode(response.body);
    print(data1);
    data = data1;
    return data1;
  }

  Future<void> getdata(String accnum) async {

    Email=data[0]["Email"];
    id = data[0]["id"];
    dob = data[0]["Dob"];
    username = data[0]["username"];
    Gender = data[0]["gender"];
    mobile = data[0]["Mobile"];
    Adress = data[0]["Address"];
    Gender = data[0]["Gender"];
    nationalid = data[0]["National"];
    Password = data[0]["password"];
    print("bebo $id");
  }
  Future Login() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/LoginDesktop.php');
    var response = await http.post(url, body: {
      "nameController": nameController.text,
      "passwordController": passwordController.text,
    });
    var data = json.decode(response.body);

    if (data.toString() == "Success") {
      await getUserData(nameController.text);
      getdata(nameController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => home(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
          ));
    } else {
      showAlertDialog(context, " Wrong username or password ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Row(children: <Widget>[
          Container(
            child: Image(image: AssetImage("images/logo2.jpeg")),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Container(
                  padding: EdgeInsets.only(left: 200),
                  child: Text(
                    'Welcome to Future National Bank',
                    style: TextStyle(color: Color(0xff8d0000), fontSize: 35),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 120,
                  ),
                  Container(
                    child: Text("Username:", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: nameController,
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 120,
                  ),
                  Container(
                    child: Text("Password:", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(40, 0, 100, 0),
                      child: ClipRRect(
                        child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                Login();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff8d0000)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color: Color(0xff8d0000))),
                                  )),
                            )),
                      )),
                ],
              ),
            ],
          )
        ])));
  }

  void showAlertDialog(BuildContext context, var text) {
    var alertDialog = AlertDialog(
      content: Text(
        text,
        style: TextStyle(color: Color(0xff8d0000), fontSize: 30),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
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

//padding: EdgeInsets.only(right: 400),
//
//                   decoration: BoxDecoration(
//                     color: Color(0xff8d0000),
//                     // image: AssetImage'',
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(0),
//
//                     ),
//
//                   )
