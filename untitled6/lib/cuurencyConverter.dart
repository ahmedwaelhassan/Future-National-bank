import 'package:flutter/material.dart';
import 'package:untitled6/Bar.dart';
import '../services/api_client.dart';
import '../widgets/drop_down.dart';
import 'Search.dart';

class currencyConverter extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  currencyConverter(
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
  State<currencyConverter> createState() => _currencyConverterState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _currencyConverterState extends State<currencyConverter> {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  _currencyConverterState(
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
  ApiClient client = ApiClient();

  Color secColor = Color(0xFF8D0000);
  List<String> currencies = [];
  String toegp = "EGP";
  String from11="";
  String to = "";
  double rate = 0;
  String result = "";

  String from1="USD";
  String from2="EUR";
  String from3="AUD";
  String from4="QAR";
  String from5="TRY";
  String from6="YER";
  String from7="SAR";
  String from8="CNY";
  String from9="BRL";
  String from10="INR";

  double rate1=0;
  double rate2=0;
  double rate3=0;
  double rate4=0;
  double rate5=0;
  double rate6=0;
  double rate7=0;
  double rate8=0;
  double rate9=0;
  double rate10=0;

  String result1b="";
  String result1s="";
  String result2b="";
  String result2s="";
  String result3b="";
  String result3s="";
  String result4b="";
  String result4s="";
  String result5b="";
  String result5s="";
  String result6b="";
  String result6s="";
  String result7b="";
  String result7s="";
  String result8b="";
  String result8s="";
  String result9b="";
  String result9s="";
  String result10b="";
  String result10s="";

  double brate=0.08;


  Future<List<String>> getCurrencyList() async {
    return await client.getCurrencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  var _index = 1;

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
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: 200,
                        ),
                        Container(
                            child: Column(children: [
                              Container(
                                child: Text(" Currency Converter ",
                                    style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                            SizedBox(
                            height: 30,
                          ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(" Input Value to Convert ",style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 400,
                                    child: TextField(
                                      onSubmitted: (value) async {
                                        rate = await client.getRate(from11, to);

                                          rate1 = await client.getRate(from11, from1);
                                          rate2 = await client.getRate(from11, from2);
                                          rate3 = await client.getRate(from11, from3);
                                          rate4 = await client.getRate(from11, from4);
                                          rate5 = await client.getRate(from11, from5);
                                          rate6 = await client.getRate(from11, from6);
                                          rate7 = await client.getRate(from11, from7);
                                          rate8 = await client.getRate(from11, from8);
                                          rate9 = await client.getRate(from11, from9);
                                          rate10 = await client.getRate(from11, from10);

                                          setState(() {
                                            result1b = (rate1 * double.parse(value)+brate).toStringAsFixed(3);
                                            result1s = (rate1 * double.parse(value)-brate).toStringAsFixed(3);

                                            result2b = (rate2 * double.parse(value)+brate).toStringAsFixed(3);
                                            result2s = (rate2 * double.parse(value)-brate).toStringAsFixed(3);

                                            result3b = (rate3 * double.parse(value)+brate).toStringAsFixed(3);
                                            result3s = (rate3 * double.parse(value)-brate).toStringAsFixed(3);

                                            result4b = (rate4 * double.parse(value)+brate).toStringAsFixed(3);
                                            result4s = (rate4 * double.parse(value)-brate).toStringAsFixed(3);

                                            result5b = (rate5 * double.parse(value)+brate).toStringAsFixed(3);
                                            result5s = (rate5 * double.parse(value)-brate).toStringAsFixed(3);

                                            result6b = (rate6 * double.parse(value)+brate).toStringAsFixed(3);
                                            result6s = (rate6 * double.parse(value)-brate).toStringAsFixed(3);

                                            result7b = (rate7 * double.parse(value)+brate).toStringAsFixed(3);
                                            result7s = (rate7 * double.parse(value)+brate).toStringAsFixed(3);

                                            result8b = (rate8 * double.parse(value)+brate).toStringAsFixed(3);
                                            result8s = (rate8 * double.parse(value)-brate).toStringAsFixed(3);

                                            result9b = (rate9 * double.parse(value)+brate).toStringAsFixed(3);
                                            result9s = (rate9 * double.parse(value)-brate).toStringAsFixed(3);

                                            result10b = (rate10 * double.parse(value)+brate).toStringAsFixed(3);
                                            result10s = (rate10 * double.parse(value)-brate).toStringAsFixed(3);

                                            result = (rate * double.parse(value))
                                            .toStringAsFixed(3);
                                          });},

                                      decoration: InputDecoration(
                                          focusedBorder: new OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 2.5)),
                                          filled: true,
                                          fillColor: Colors.white,),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                                SizedBox(
                                height: 30,
                              ),

                            Container(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("From",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: customDropDown(currencies, from11,
                                          (val) {
                                        setState(() {
                                          from11 = val;
                                        });
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    String temp = from11;
                                    setState(() {
                                      from11 = to;
                                      to = temp;
                                    });
                                  },
                                  child: Icon(Icons.swap_horiz),
                                  elevation: 0.0,
                                  backgroundColor: secColor,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text("To",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          )),
                                    ),
                                    Container(
                                      child:
                                          customDropDown(currencies, to, (val) {
                                        setState(() {
                                          to = val;
                                        });
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 430,
                            margin: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Text(
                                  "Result",
                                  style: TextStyle(
                                    color: secColor,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(result,
                                    style: TextStyle(
                                      color: secColor,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],

                            ),
                          ),
                        ])),
                        SizedBox(
                          width: 200,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
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
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffffeaea),
                                        Color(0xffffffff),
                                      ],
                                    ),
                                  ),
                                  dividerThickness: 3,

                                  columns: [

                                    DataColumn(label: Text("Currency",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                                    DataColumn(label: Text("Buy",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                                    DataColumn(label: Text("Sell",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                                  ],

                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text("$from1 (\$)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result1b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result1s",style: TextStyle(fontSize: 16))),

                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from2 (€)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result2b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result2s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from3 (\$)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result3b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result3s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from4(﷼)  ",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result4b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result4s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from5 (₺)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result5b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result5s",style: TextStyle(fontSize: 16))),

                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from6(﷼)  ",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result6b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result6s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from7(﷼)  ",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result7b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result7s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from8 (¥)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result8b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result8s",style: TextStyle(fontSize: 16))),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from9 (R\$)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result9b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result9s",style: TextStyle(fontSize: 16))),

                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text("$from10 (₹)",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result10b",style: TextStyle(fontSize: 16))),
                                      DataCell(Text("$result10s",style: TextStyle(fontSize: 16))),
                                    ]),


                                  ],
                                ),

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))));
  }
}

/*
                  Column(
                      children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text("Currency Converter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(500, 0, 500, 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                    ),
                                  ]),
                              child: TextField(
                                onSubmitted: (value) async {
                                  rate = await client.getRate(from, to);

                                  setState(() {
                                    result = (rate * double.parse(value))
                                        .toStringAsFixed(3);
                                  });
                                },
                                decoration: InputDecoration(
                                    focusedBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.5)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Input Value to Convert",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    )),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text("From",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          )),
                                    ),
                                    Container(
                                      child: customDropDown(currencies, from,
                                          (val) {
                                        setState(() {
                                          from = val;
                                        });
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    String temp = from;
                                    setState(() {
                                      from = to;
                                      to = temp;
                                    });
                                  },
                                  child: Icon(Icons.swap_horiz),
                                  elevation: 0.0,
                                  backgroundColor: secColor,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text("To",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          )),
                                    ),
                                    Container(
                                      child:
                                          customDropDown(currencies, to, (val) {
                                        setState(() {
                                          to = val;
                                        });
                                      }),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 450,
                              margin: EdgeInsets.only(left: 500, right: 500),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Text(
                                    "Result",
                                    style: TextStyle(
                                      color: secColor,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(result,
                                      style: TextStyle(
                                        color: secColor,
                                        fontSize: 36.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),*/
