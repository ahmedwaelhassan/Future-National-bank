import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Bar.dart';
import 'Crypto/crypto.dart';
import 'Search.dart';

class certificaterequest extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  certificaterequest({
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
  State<certificaterequest> createState() => certificaterequestState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}
TextEditingController certtidd =TextEditingController();
var status ;

Future Updatedata(var certid) async {

  var url = Uri.parse(
      'https://inconspicuous-pairs.000webhostapp.com/cert%20getdata.php');
  print(certid);
  final response = await http.post(url, body: {
    "certid": certid,
    "status": status,

  });
  try {
    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
      print("mansour");
    } else if (data == "Success") {
      print("bebo");
    } else {
      print("error");
    }
  } catch (e) {
    print(e);
  }
}


class certificaterequestState extends State<certificaterequest> {

  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  certificaterequestState({
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

  Future<List<dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/certrequestDesktopppp.php?status='''));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load Loan requests');
    }
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
                      Column(
                        children: [SizedBox(
                          height: 10,
                        ),
                          Center(
                            child: Text(" Certificate requests ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),

                          SizedBox(
                            height: 530,
                            child: FutureBuilder<List<dynamic>>(
                              future: fetchTransactions(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
                                      final aes = Aes(key);
                                      final decryptedAcc = utf8.decode(aes.decrypt(base64Decode(snapshot.data?[index]['accountnumber'])));

                                      return Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 350, right: 350, top: 20, bottom: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 5, color: Color(0xfffcc8c8)),
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xfffcc8c8),
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '  Certificate id : ${snapshot.data?[index]['certid']}',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        padding: EdgeInsets.only(left: 5),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '  Type : ${snapshot.data?[index]['certtype']}',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        padding: EdgeInsets.only(left: 5),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '  Amount : ${snapshot.data?[index]['certamount']}',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        padding: EdgeInsets.only(left: 5),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '  Date : ${snapshot.data?[index]['certdate']}',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        padding: EdgeInsets.only(left: 5),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '  Account number : ${decryptedAcc}',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        padding: EdgeInsets.only(left: 5),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                // By default, show a loading spinner.
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                      color: Color(0xff8d0000),
                                    ));
                              },
                            ),
                          ),
                          SizedBox(
                            height:30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(" Certificate id : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: certtidd,
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  child: Column(children: <Widget>[
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(certtidd.text == "")
                                          {
                                            showAlertDialog(context, " Enter Certificate id ");
                                          }
                                          else {
                                            Updatedata(certtidd.text);
                                            status = "Approved";
                                            setState(() {
                                              showAlertDialog(context,
                                                  " Certificate request has been approved");
                                            });
                                          }
                                        },
                                        child: Text(
                                          'Approve',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 1,
                                                  color: Colors.black)),
                                          primary: Color(0xff8d0000),
                                        ),
                                      ),
                                    )
                                  ])),
                              SizedBox(width: 20),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {

                                    if(certtidd.text == "")
                                    {
                                      showAlertDialog(context, " Enter Certificate id ");
                                    }
                                    else {
                                      Updatedata(certtidd.text);
                                      status = "Denied";
                                      setState(() {
                                        showAlertDialog(context,
                                            " Certificate request has been denied");
                                      });
                                    }
                                  },
                                  child: Text('Denied',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 1,
                                            color: Colors.black)),
                                    primary: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )

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
            onPressed: () {},
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
