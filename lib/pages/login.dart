import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "email",
                hintStyle: TextStyle(
                  color: Colors.white54,
                
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  ),
                ),
            ),
             TextField(
              decoration: InputDecoration(
                hintText: "password"
                ),
            ),   
        ],
        ),
      ),

    );
  }

  appBarMain(BuildContext context) {}
}