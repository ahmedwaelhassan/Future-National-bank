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