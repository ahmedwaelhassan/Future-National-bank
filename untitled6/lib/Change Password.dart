import 'package:flutter/material.dart';

import 'Bar.dart';

class changepass extends StatefulWidget {
  const changepass({Key? key}) : super(key: key);

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          backgroundColor: Color(0xff8d0000),

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
            title: Text(' Change Password'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                //bottom: Radius.circular(25),
              ),
            ),
          ),

          body:

              Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: ListView(

                      padding: EdgeInsets.only(left: 20,right: 20),
                      children: <Widget>[

                        SizedBox(height: 40,),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),

                              child: Text('Current password : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),

                            )

                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0,right: 1200),
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
                            obscureText: true,
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {

                              });

                            },
                            decoration: InputDecoration(
                              focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black),),

                          ),
                        ),
                        SizedBox(height:30,),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),

                              child: Text('New password : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),

                            )

                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0,right: 1200),
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
                            obscureText: true,
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black),),

                          ),
                        ),
                          SizedBox(
                            height: 15,
                          ),
                        Container(
                          padding: EdgeInsets.only(left: 12),
                          child:Text('-At least 8 characters\n-At least 1 uppercase letter\n-At least 1 number\n-Must have special character',style: TextStyle(fontSize: 16)) ,
                        ),


                        SizedBox(height:20,),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),

                              child: Text('Confirm password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),

                            )

                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0,right: 1200),
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
                            obscureText: true,
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              setState(() {

                              });
                            },

                            decoration: InputDecoration(
                              focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black),),

                          ),

                        ),



                        SizedBox(height:50,),
                        Container(
                            margin: EdgeInsets.only(left: 0,right: 1200),
                            width: size.width * 0.9,
                            child: ClipRRect(
                              child: SizedBox(height: 50,width: 100, child:
                              ElevatedButton(
                                // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                                // color: Colors.deepOrange,
                                onPressed: () async {
                                },
                                child: Text(
                                  'Save changes',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(25),
                                          side: BorderSide(color: Color(0xff8d0000))
                                      ),)
                                ),
                              )),
                            )),




                      ],
                    ),
                  ),
                ),),

        ));
  }
}