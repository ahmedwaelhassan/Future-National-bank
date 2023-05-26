import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';

import 'Search.dart';

class LoanAmount extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  LoanAmount(
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
  State<LoanAmount> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<LoanAmount> {
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

  TextEditingController amount = new TextEditingController();
  TextEditingController period = new TextEditingController();
  TextEditingController rate = new TextEditingController();

  num monthly=0;
  num payable=0;
  num interest=0;

  void calculate(){

    interest=((((num.parse(amount.text)/100)*num.parse(rate.text))/12)*num.parse(period.text));
    payable=num.parse(amount.text)+interest;
    monthly=payable~/num.parse(period.text);

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
                    child: Text("Loan amount calculator",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 500,
                      ),
                      Container(
                        child: Text(" Loan Amount :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: amount,
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1,color: Colors.black)),
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ])),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        width: 680,
                      ),
                      Container(
                        child: Text("Min : EGP 5,000 ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff8d0000),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                          child: Text(
                        "MAX : EGP 1,500,000",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff8d0000),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(
                        height: 50,
                      ),
                    ])),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 500,
                      ),
                      Container(
                        child: Text(" Loan Period :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          controller: period,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
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
                    ])),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 680,
                      ),
                      Container(
                        child: Text("Min : 6 Months ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff8d0000),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Container(
                          child: Text(
                        "MAX : 120 Months ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff8d0000),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                    ])),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 500,
                      ),
                      Container(
                        child: Text(" Interest Rate :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: rate,
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
                    ])),
                    Container(
                        child: Row(children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 680,
                      ),
                      Container(
                        child: Text("Min : 16 % ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff8d0000),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Container(
                          child: Text(
                        "MAX : 21 % ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff8d0000),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(180, 0, 100, 10),
                      child: ElevatedButton(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: size.width * 0.1,
                                child: Text(" Calculate ",
                                    textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff8d0000)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color(0xff8d0000))))),
                          onPressed:()  async {
                            setState(() {
                              if(int.parse(amount.text)>=5000 && int.parse(amount.text)<=1500000 && int.parse(period.text)>=6 && int.parse(period.text)<=120 && int.parse(rate.text)>=16 &&int.parse(rate.text)<=21){
                                calculate();
                              }
                              else
                              {
                                showAlertDialog(context, " please check the constraints of the form! ");
                              }

                            });
                          },
                      ),
                    )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 30, 60),
                      child: Container(
                        width: 350,
                        height: 160,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Color(0xff8d0000)),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff8d0000),
                        ),
                        child: Column(
                          children:<Widget> [

                            SizedBox(height: 10,),
                            Container(
                              child: Text('Your monthly payments',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('EGP $monthly',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                            ),
                            SizedBox(height: 5,),
                            Divider(color: Colors.white,indent: 30,endIndent: 30,thickness: 1),
                            SizedBox(height: 5,),

                            Row(
                              children:<Widget> [

                                SizedBox(width: 35),
                                Column(children:<Widget> [

                                  Container(
                                    child: Text('Total payable',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Text('EGP $payable',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                                  ),
                                ],),

                                SizedBox(width: 35),
                                Column(children:<Widget> [

                                  Container(
                                    child: Text('Total interest',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Text('EGP $interest',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                                  ),
                                ],),


                              ],
                              mainAxisAlignment:MainAxisAlignment.center,
                            )

                          ],
                        ),
                      ),
                    ),
                  ])
                ]))));
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
