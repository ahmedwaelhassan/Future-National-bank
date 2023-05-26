import 'package:flutter/material.dart';
import 'Login.dart';
import 'home.dart';

void main() {
    runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Smart Future National Bank System ',
     // home: home(),
      //home:loan(),
      //home:transfers(),
      //home: createaccount(),
      home:login(),
    );
  }
}