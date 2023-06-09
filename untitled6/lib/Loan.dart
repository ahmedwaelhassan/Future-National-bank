import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Bar.dart';
import 'Search.dart';

class loan extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  loan({
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
  State<loan> createState() => loanState(
      Email: Email,
      Password: Password,
      username: username,
      mobile: mobile,
      Gender: Gender,
      dob: dob,
      id: id,
      Adress: Adress,
      nationalid: nationalid);
}

TextEditingController loanidd = TextEditingController();

class loanState extends State<loan> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  loanState({
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

  var status;

  var h;

  Future Updatedata(var loanid) async {
    print(loanid);
    final response = await http.post(
        Uri.parse(
            'https://inconspicuous-pairs.000webhostapp.com/update%20loan%20request.php'),
        body: {
          "loanid": loanid,
          "loanstatus": status,
        });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
        print("mansour");
      } else if (data == "Success") {
        if (status == 'Approved') {
          showAlertDialog(context, "Loan request has been Approved");
        } else {
          showAlertDialog(context, "Loan request has been Denied");
        }
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/loanrequestttttttttdeskk.php?loanstatus='
        ' '));

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
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(" Loan request ",
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
                                  return Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 20,
                                            bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 5,
                                                color: Color(0xfffcc8c8)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xfffcc8c8),
                                          ),
                                          child:  Container(
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
                                                DataColumn(label: Text("Loan id ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Account number ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Name ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Amount ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Period ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Rate ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Total interest ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Total payable ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Monthly ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Job ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Salary ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                                DataColumn(label: Text("Image ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                              ],
                                              rows: [
                                                DataRow(cells: [
                                                  DataCell(Text("${snapshot.data?[index]['loanid']} ",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['accountnumber']}",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['name']} ",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['amount']} (EGP)",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['period']}",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['rate']} (%)",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['totalinterest']} (EGP)",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['totalpayable']} (EGP) ",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['monthly']} (EGP)",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['job']} ",style: TextStyle(fontSize: 13))),
                                                  DataCell(Text("${snapshot.data?[index]['salary']} (EGP) ",style: TextStyle(fontSize: 13))),
                                                  DataCell(IconButton(onPressed: (){
                                                    showDialog(context: context, builder: (context) =>
                                                      Image.memory(base64Decode(snapshot.data?[index]['image'])));},
                                                      icon: Icon(Icons.image))),

                                                ]),
                                              ],
                                            ),
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(" Loan id : ",
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
                              controller: loanidd,
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
                              textAlignVertical: TextAlignVertical.center,
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
                                  if(loanidd.text == "")
                                  {
                                    showAlertDialog(context, " Enter loan id ");
                                  }
                                  else {
                                    Updatedata(loanidd.text);
                                    status = "Approved";
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
                                if(loanidd.text == "")
                                {
                                  showAlertDialog(context, " Enter loan id ");
                                }
                                else {
                                  Updatedata(loanidd.text);
                                  status = "Denied";
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
