import 'package:flutter/material.dart';


void showAlertDialog(BuildContext context){
  var alertDialog = AlertDialog(

    title: Text('Terms & Conditions',),
    content: Text('1.  \n2.    \n3.    \n4.   \n5.    \n6.    \n7.    '),
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.pop(context);


      },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),),
          child: Text('Ok')),



    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );
}
void showAlertDialog1( BuildContext context, var text) {
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