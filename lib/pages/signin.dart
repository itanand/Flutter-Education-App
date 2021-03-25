import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart'; 
// import 'package:flutter_application_anand/pages/signup.dart';
// import 'package:flutter_application_anand/pages/homepage.dart';
import 'package:flutter_application_anand/animation/FadeAnimation.dart';
import 'package:flutter_application_anand/pages/signup.dart';


class LoginPage extends StatefulWidget with NavigationStates{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> { 

  String _email;
  String _password;
  @override 

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Form(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      
                        FadeAnimation(1, Text("Login", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                       
                        ),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.2, Text("Login to your account", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                        ),)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[  
                          
                          FadeAnimation(1.2, 
                          TextField(
                            decoration: InputDecoration(hintText: 'Email'),
                            onChanged: (value) {
                              setState((){
                                _email = value;
                              });
                            }
                          )
                      
                           ),
                          
                          SizedBox(height: 20.0),
                          FadeAnimation(1.2, 
                         TextFormField(
                         decoration: const InputDecoration(
                            
                            labelText: 'Password',
                            icon: const Padding(
                               padding: const EdgeInsets.only(top: 15.0),
                               child: const Icon(Icons.lock),
                                )
                                
                                ),
                              
                             validator: (val) => val.length < 6 ? 'Password too short.' : null,
                          onSaved: (val) => _password = val,
                             obscureText: true,

                              onChanged: (value) {
                              setState((){
                                _password = value;
                              });
                               }
                            )
                      
                           ),
                          
                         Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                             padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                              child: Text("Forgot Password",),

                            ),
                          ),
                          
                          FadeAnimation(1.4, Text("OR", style: TextStyle(
                          fontSize: 18,

                          fontWeight: FontWeight.bold
                        ),)),
                           FadeAnimation(1.5, makeInput(label: "Mobile Number", obscureText: true)),
                        ],
                      ),
                    ),
                    FadeAnimation(1.4, Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          
                        ),
                        
                      ),
                    )
                    ),
                     FadeAnimation(1.5, RaisedButton(
                     child: Text('SignIn'),
                     color: Colors.blue,
                     textColor: Colors.white,
                     elevation: 7.0,
                     onPressed: (){
                       FirebaseAuth.instance.signInWithEmailAndPassword(
                         email: _email,
                         password: _password,
                         )   
                         .then(( AuthResult user){ })
                         .catchError((e){
                        
                         });
                     },)),
                    FadeAnimation(1.5, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[
                        Text("Don't have an account?"),
                        RaisedButton(
                          child: Text('Signup'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 7.0,
                          onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          ),
                           
                  
                        
                      ],
                    ))
                  ],
                ),
              ),
              FadeAnimation(1.2, Container(
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover
                  )
                ),
              ))
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
        SizedBox(height: 5,),
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
        SizedBox(height: 30,),
      ],
    );
  }
}