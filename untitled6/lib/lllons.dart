import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Installment.dart';
import 'package:untitled6/Loan.dart';

import 'Bar.dart';
import 'Loan Amount.dart';

class lloans extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  lloans(
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
  State<lloans> createState() => _lloansState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _lloansState extends State<lloans> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _lloansState(
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
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: Color(0xff8d0000),
              centerTitle: true,
              title: Text('Loan Requests'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    //bottom: Radius.circular(25),
                    ),
              ),
            ),
            body: Column(
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
                DefaultTabController(
                    length: 6,
                    child: Column(children: <Widget>[
                      Expanded(
                          child: TabBarView(children: [
                        ListView(children: [
                          Column(children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => loan(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                            ));
                                      },
                                      child: Text(" Loan Request's ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center),
                                      style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 20, 50, 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1,
                                                color: Colors.black)),
                                        primary: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Installment(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                            ));
                                      },
                                      child: Text(' Loan Installment Calculator ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center),
                                      style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 20, 50, 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1,
                                                color: Colors.black)),
                                        primary: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoanAmount(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                            ));
                                      },
                                      child: Text('Loan Amount Calculator ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center),
                                      style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 20, 50, 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1,
                                                color: Colors.black)),
                                        primary: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ])
                          ])
                        ])
                      ]))
                    ])),
              ],
            )));
  }
}
