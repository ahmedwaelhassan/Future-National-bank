import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';

import 'Search.dart';

class Currency extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  Currency(
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
  State<Currency> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<Currency> {

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
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Center(
                            child: Column(children: [
                              Row(
                                children: [
                                  SizedBox(width: 500),
                                  Container(
                                      child: Text(" From :",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  SizedBox(
                                    width: 256,
                                  ),
                                  Container(
                                    child: Text(" TO :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              Center(
                                child: Row(children: [
                                  SizedBox(
                                    width: 500,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 250,
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 3)),
                                        focusColor: Colors.black,
                                        hintText: "EGP",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff8d0000)),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      child: Icon(
                                    Icons.compare_arrows_outlined,
                                    size: 50,
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: TextField(
                                        cursorColor: Colors.black,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 3)),
                                          focusColor: Colors.black,
                                          hintText: "USD",
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff8d0000)),
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 18),
                                      ))
                                ]),
                              )
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 500,
                              ),
                              SizedBox(
                                height: 30,
                                width: 250,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3)),
                                    focusColor: Colors.black,
                                    hintText: "1000",
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Color(0xff8d0000)),
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: ElevatedButton(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(" Calculate ",
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
                                                    color:
                                                        Color(0xff8d0000))))),
                                    onPressed: () => null),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(children: [
                            SizedBox(
                              width: 650,
                            ),
                            Container(
                              child: Icon(
                                Icons.east,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: TextField(
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
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ]),
                ))));
  }
}
