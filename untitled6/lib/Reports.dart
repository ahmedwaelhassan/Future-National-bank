import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:guarded_button/guarded_button.dart';
import 'package:untitled6/Bar.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:untitled6/Compliments.dart';
import 'package:untitled6/certmessage.dart';
import 'package:untitled6/offers.dart';
import 'package:untitled6/withdrawww%20message.dart';
import 'Dmessage.dart';
import 'Search.dart';
import 'loansmessage.dart';

class Reports extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";

  Reports(
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
  State<Reports> createState() => _MyAppState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid);
}

class _MyAppState extends State<Reports> {
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
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Color(0xff8d0000);
    }
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
                body: Center(
                    child: ListView(children: [
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
                    height: 30,
                  ),
                  Center(
                      child: Column(children: [
                    Center(
                      child: Text("Messages ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        Row(children: [
                          GuardedElevatedButton(
                            guard: Guard(),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 100),
                              backgroundColor: Color(0xff8d0000),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                PageRouteAnimator(
                                  child:  dmessage(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 1000),
                                  reverseDuration:
                                  const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' Deposit ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GuardedOutlinedButton(
                            guard: Guard(),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(200, 100),
                              backgroundColor: Color(0xff00052f),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                PageRouteAnimator(
                                  child:  wmessage(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 1000),
                                  reverseDuration:
                                      const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' Withdraw ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GuardedOutlinedButton(
                            guard: Guard(),
                            style: OutlinedButton.styleFrom(
                              animationDuration: Duration(seconds: 3),
                              fixedSize: Size(200, 100),
                              backgroundColor: Color(0xff00052f),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(context,
                                PageRouteAnimator(
                                  child:  offermessages(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 500),
                                  reverseDuration:
                                  const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' Offers ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),

                        ], mainAxisAlignment: MainAxisAlignment.center),
                        SizedBox(
                          height: 50,
                        ),
                        Row(children: [
                          GuardedElevatedButton(
                            guard: Guard(),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 100),
                              backgroundColor: Colors.black26,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                PageRouteAnimator(
                                  child:  Compliment(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 1000),
                                  reverseDuration:
                                  const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' Compliments ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GuardedOutlinedButton(
                            guard: Guard(),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(200, 100),
                              backgroundColor: Color(0xff8d0000),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                PageRouteAnimator(
                                  child:  lmessage(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 500),
                                  reverseDuration:
                                  const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' loans ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GuardedOutlinedButton(
                            guard: Guard(),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(200, 100),
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                PageRouteAnimator(
                                  child:  cmessage(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),
                                  routeAnimation: RouteAnimation.bottomToTop,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 500),
                                  reverseDuration:
                                  const Duration(milliseconds: 500),
                                ),
                              )
                            },
                            onLongPress: () => {},
                            child: const Text(' Certificates ',style: TextStyle(fontSize: 22),textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ], mainAxisAlignment: MainAxisAlignment.center),

                      ]

                    )
                  ]))
                ])))));
  }
}
