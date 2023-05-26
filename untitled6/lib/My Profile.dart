import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart%20';
import 'package:untitled6/Bar.dart';
import 'package:untitled6/Change%20Password.dart';
import 'package:http/http.dart'as http;
import 'Search.dart';

class Profile extends StatefulWidget {

  String Email="";
  String Password ="";
  String username="";
  String mobile="";
  String Gender="";
  String dob="";
  String id="";
  String Adress="";
  String nationalid="";

  Profile( {
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
  var data;

  @override
  State<Profile> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid
  );
}

class _MyAppState extends State<Profile> {

  String Email="";
  String Password ="";
  String username="";
  String mobile="";
  String Gender="";
  String dob="";
  String id="";
  String Adress="";
  String nationalid="";

  _MyAppState( {
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
var data;

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
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Search(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),));
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
                  Row(
                    children: [
                      Container(
                        height: 680,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color(0xff8d0000),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  child: Icon(Icons.account_circle,size: 70,color: Colors.white,)
                                ),
                            Container(
                                  child: Text(" My Personal Data ",style: TextStyle(color: Colors.white,fontSize: 45),),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                        Container(
                          width: 530,
                            child: Column(children: [
                            Row(children: <Widget>[
                              SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              Container(
                                child: Text(" Id : ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Text(" $id ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ]),
                            Row(children: <Widget>[
                              SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              Container(
                                child: Text(" Username :",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Text(" $username ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ]),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                Container(
                                  child: Text(" Email :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(" $Email ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(" Mobile number :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text(" $mobile ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ]),
                            // Second Row
                            Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(" Address :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text(" $Adress ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ]),
                            // rabe33 line

                              Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    Container(
                                      child: Text(" Gender :",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Text(" $Gender",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ]),
                            // 5ames line
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                Container(
                                  child: Text(" National id : ",

                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(" $nationalid ",

                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
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
                                Container(
                                  child: Text(" $dob ",

                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(" Password : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text(" ****** ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    " Change Password : ",
                                   style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => changepass(),));
                                  }, icon: Icon(Icons.password))
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                      ])

                    ),
                  ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )


                ])]))));
  }}

