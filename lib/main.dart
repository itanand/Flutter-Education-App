
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_anand/pages/welcome.dart';
import 'dart:async';

void main() {
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edufy',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), welcome);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
           image:AssetImage('assets/images/background.jpg')
           )
      ),
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png')
            )
          ),
        )
      ),
      ),
    );
  }


void welcome(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()),);
}
}