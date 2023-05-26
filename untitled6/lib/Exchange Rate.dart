import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';

import 'Search.dart';


class Exchange extends StatefulWidget {
  
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  Exchange(
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
  State<Exchange> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<Exchange> {
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
                          ),])
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text("Exchange rates",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Egyptian pound exchange",
                      style: TextStyle(
                        color: Color(0xff8d0000),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: DataTable(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffffeaea),
                            Color(0xffffffff),
                          ],
                        ),
                      ),
                      dividerThickness: 3,
                      columns: [
                        DataColumn(
                          label: Text("Currency",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text("Buy",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text("Sell",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("USD", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("EUR", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("SAR", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("GBP", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("AED", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("CHF", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("AUD", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.40", style: TextStyle(fontSize: 18))),
                          DataCell(
                              Text("30.70", style: TextStyle(fontSize: 18))),
                        ]),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
  }
}
