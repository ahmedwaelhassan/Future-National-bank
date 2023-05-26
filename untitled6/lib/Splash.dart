import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled6/Login.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {


  @override
  void initstate() async {
    super.initState();
    _play();
  }


  void _play() async {

    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff8d0000),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset("images/fnb2.jpeg",scale:2.5),
              SizedBox(height: 50,),
              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ],

          ),
        )


    );
  }
}