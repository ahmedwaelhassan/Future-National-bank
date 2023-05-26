import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Update(),
  ));
}

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _MyAppState();
}

class _MyAppState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 10,
            child: Scaffold(
                appBar: AppBar (
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                    onPressed: ()=> Navigator.pop(context),

                  ),
                  backgroundColor:Color(0xff8d0000) ,
                  centerTitle: true,
                  title: Text (' Update Account '),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      //bottom: Radius.circular(25),
                    ),
                  ),

                ),
                body: ListView(children: [
                  Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    // awl line
                    Container(
                        child: Column(children: [
                          SizedBox(
                            width: 30,
                          ),
                          Row(children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 50,
                            ),
                            Container(
                              child: Text(" Account Number :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(
                              width: 30,
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
                                      borderSide: BorderSide(width: 1)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
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
                              child: Text(" Customer Name :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(
                              width: 30,
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
                                      borderSide: BorderSide(width: 1)),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
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
                                child: Text(" Mobile Number :",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
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
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          // Second Row
                          Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                Container(
                                  child: Text(" Address : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                SizedBox(
                                  width: 30,
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
                                              borderSide: BorderSide(width: 5)),
                                          focusColor: Colors.black,
                                          labelStyle: TextStyle(color: Colors.black),
                                        ),
                                        style: TextStyle(fontSize: 18)))
                              ]),
                          // rabe33 line
                          Container(
                            child: Column(
                              children: [
                                Row(children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(" Gender : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: " Male ",
                                    onChanged: (index) {},
                                  ),
                                  Text(" Male "),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: " Female",
                                    onChanged: (index) {},
                                  ),
                                  Text(" Female "),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          // 5ames line
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              Container(
                                child: Text(" National ID : ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
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
                                        borderSide: BorderSide(width: 5)),
                                    focusColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(fontSize: 30),
                                ),
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
                                width: 30,
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
                                        borderSide: BorderSide(width: 5)),
                                    focusColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: ElevatedButton(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(" Update ".toUpperCase(),
                                                    style: TextStyle(fontSize: 18)),
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
                                                          color: Color(0xff8d0000))))),
                                          onPressed: () => null),)),
                                Container(
                                  child: Text("Account Number 45126554895412356 Has been Updated ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xff8d0000)),),
                                )



                              ])]))])]))));}}

