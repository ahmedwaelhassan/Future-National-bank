import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';
import 'package:untitled6/Certificate.dart';
import 'package:untitled6/DarkMode.dart';
import 'package:untitled6/Deposit.dart';
import 'package:untitled6/Exchange%20Rate.dart';
import 'package:untitled6/Get%20Card.dart';
import 'package:untitled6/Last%20Transaction.dart';
import 'package:untitled6/Loan%20Amount.dart';
import 'package:untitled6/My%20Profile.dart';
import 'package:untitled6/Search.dart';
import 'package:untitled6/Update.dart';
import 'package:untitled6/lllons.dart';
import 'Card Type.dart';
import 'Create Account.dart';
import 'Currency.dart';
import 'Delete Acc.dart';
import 'Installment.dart';
import 'Loan.dart';
import 'Transfer.dart';
import 'cuurencyConverter.dart';

import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class home extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  home(
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
  State<home> createState() => _homeState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);

}
class _homeState extends State<home> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _homeState(
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
  TextEditingController dateinput = TextEditingController();
  String? gender;
 List<String> list = <String>['English', 'Arabic', 'French', 'German'];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
            body: DefaultTabController(
              length: 1,
              child: Column(
                children: <Widget>[
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
                  Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Column(children: [
                                      Column(
                                        children: [
                                          Container(
                                              child: Image(
                                                image: AssetImage("images/photo1.png"),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: [
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Card(
                                          elevation: 20,
                                          color: Colors.white,
                                          surfaceTintColor: Color(0xff8d0000),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " Create New Account  ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage("images/Create.jpg"),
                                                    height: 250,
                                                    width: 300,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Color(0xff8d0000))),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  createaccount(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid)),
                                                        );

                                                      },
                                                      child: Text("Create",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18))),
                                                ],
                                              ),
                                              Row(
                                                children: [Text(" ")],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Card(
                                          elevation: 20,
                                          color: Colors.white,
                                          surfaceTintColor: Color(0xff8d0000),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " News Room ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage("images/news.jpg"),
                                                    height: 250,
                                                    width: 300,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Color(0xff8d0000))),
                                                      onPressed: () {},
                                                      child: Text(" Go ",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 18)))
                                                ],
                                              ),
                                              Row(
                                                children: [Text(" ")],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Card(
                                          elevation: 20,
                                          color: Colors.white,
                                          surfaceTintColor: Color(0xff8d0000),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " Currencies ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage("images/Curr.jpg"),
                                                    height: 250,
                                                    width: 300,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Color(0xff8d0000))),
                                                      onPressed: () {Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                currencyConverter(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid)),
                                                      );},
                                                      child: Text(" Show ",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 18)))
                                                ],
                                              ),
                                              Row(
                                                children: [Text(" ")],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Card(
                                          elevation: 20,
                                          color: Colors.white,
                                          surfaceTintColor: Color(0xff8d0000),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " Branches ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage("images/Bank.jpg"),
                                                    height: 250,
                                                    width: 300,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStatePropertyAll(
                                                            Color(0xff8d0000)),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(" Location ",
                                                          style: TextStyle(
                                                              color: Colors.white, fontSize: 18)))
                                                ],
                                              ),
                                              Row(
                                                children: [Text(" ")],
                                              )
                                            ],
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ])

                                  ],
                                ),]),
                ],
              ),
            )]))));
  }
}
