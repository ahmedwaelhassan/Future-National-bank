import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';

import 'Search.dart';

class CardType extends StatefulWidget {

  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";
  var data;

  CardType(
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
  State<CardType> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<CardType> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";
  var data;

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
                            ])
                  ),
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
                       PlutoMenuBarDemo(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(" Card Types ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: Text('My Card',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff000417),
                              Color(0xff1e232a),
                            ],
                          ),
                        ),
                        child: Column(children: [
                          Row(
                            children: <Widget>[
                              Container(
                                child: Image(
                                    image: AssetImage('images/fnb1.png'),
                                    height: 80,
                                    width: 100),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Image(
                                  image: AssetImage('images/chip.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('**  **  **  **',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 240),
                                child: Text('EXP ../..',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Name',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                        thickness: 4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: Text('Cards Offers',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff272d34),
                              Color(0xffc7c7c7),
                            ],
                          ),
                        ),
                        child: Column(children: [
                          Row(
                            children: <Widget>[
                              SizedBox(width: 40),
                              Container(
                                  child: Text(
                                'Debit',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                              SizedBox(width: 150),
                              Container(
                                child: Image(
                                    image: AssetImage('images/fnb1.png'),
                                    height: 80,
                                    width: 100),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Image(
                                  image: AssetImage('images/chip.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('**  **  **  **',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 240),
                                child: Text('EXP ../..',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Name',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Maximum Credit Limit : 250,000 EGP',
                                style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                                'Grace period : up to 57 days for purchase',
                                style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                        thickness: 4,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffb29c00),
                              Color(0xffffd100),
                            ],
                          ),
                        ),
                        child: Column(children: [
                          Row(
                            children: <Widget>[
                              SizedBox(width: 40),
                              Container(
                                  child: Text(
                                'Gold',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                              SizedBox(width: 160),
                              Container(
                                child: Image(
                                    image: AssetImage('images/fnb1.png'),
                                    height: 80,
                                    width: 100),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Image(
                                  image: AssetImage('images/chip.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('**  **  **  **',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 240),
                                child: Text('EXP ../..',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Name',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Maximum Credit Limit : 100,000 EGP',
                                style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Online card usage : available',
                                style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Card usage : locally and abroad',
                                style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
