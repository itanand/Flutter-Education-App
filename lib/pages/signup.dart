import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:flutter_application_anand/animation/FadeAnimation.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  // String _name;
  // String _state;
  // String _education;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color(0xFF1E255E),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 5,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Sign up", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.2, Text("Create an account, It's free", style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700]
                  ),)),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.0, TextField(
                            decoration: InputDecoration(hintText: 'Email'),
                            onChanged: (value) {
                              setState((){
                                _email = value;
                              });
                            }
                          )),
                  FadeAnimation(1.2, TextField(
                            decoration: InputDecoration(hintText: 'Name'),
                            onChanged: (value) {
                              setState((){
                                _email = value;
                              });
                            }
                          )),
                  FadeAnimation(1.3, TextField(
                            decoration: InputDecoration(hintText: 'State'),
                            onChanged: (value) {
                              setState((){
                                _email = value;
                              });
                            }
                          )),
                  FadeAnimation(1.4, TextField(
                            decoration: InputDecoration(hintText: 'Education'),
                            onChanged: (value) {
                              setState((){
                                _email = value;
                              });
                            }
                          )),
                  
                  FadeAnimation(1.5, TextField(
                            decoration: InputDecoration(hintText: 'Password'),
                            onChanged: (value) {
                              setState((){
                                _password = value;
                              });
                            }
                          )),
                     SizedBox(height: 40.0),
                   FadeAnimation(1.5, RaisedButton(
                     child: Text('SignUp'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     elevation: 7.0,

                     onPressed: (){
                       FirebaseAuth.instance.createUserWithEmailAndPassword(
                         email: _email,
                        //  name: _name,
                        //  state: _password,
                        //  education: _education,
                         password: _password,
                         )
                         .then((signedInUser){

                         })
                         .catchError((e){
                           print(e);
                         });
                     },)),
                ],
              ),
              
              FadeAnimation(1.6, Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(" Login", style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18, color: Colors.red,
                  ),),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),),
        SizedBox(height: 4,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}