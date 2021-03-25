import 'package:flutter/material.dart';
import 'package:flutter_application_anand/bloc.navigation_bloc/navigation_bloc.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_application_anand/pages/mocktest.dart';
import 'package:flutter_application_anand/pages/course.dart';
import 'package:flutter_application_anand/pages/homepage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_anand/pages/payment.dart';
import 'package:flutter_application_anand/animation/FadeAnimation.dart';


class Membership extends StatelessWidget  with NavigationStates{
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Membership'),
     centerTitle: true,
     backgroundColor: Color(0xFF1E255E),
     ),
   body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Become a Pro Member", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),)),
  
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, Text("Hey Guys! Let's Try 1st Month for Free. Get Access of over 100+ Medical/ nursing / Dental Courses and Books. Get the intressting offers on the 1 year of plan's. There are Many Products and Items. ", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),
                  )
                  ),
                  
                ],
                
              ),
              FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/payment.png')
                  )
                ),
              )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: Color(0xFF1E255E),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
                        
                      },
                    shape: RoundedRectangleBorder( 
                      side: BorderSide(
                        color: Color(0xFF1E255E),
                         
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("Upgrade to PRO", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                  )),
                  SizedBox(height:20,),
                  FadeAnimation(1.6, Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // border: Border(
                       //   bottom: BorderSide(color: Colors.black),
                      //   top: BorderSide(color: Colors.black),
                      //   left: BorderSide(color: Colors.black),
                      //   right: BorderSide(color: Colors.black),
                      // )
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),


     bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.home_outlined),
                       onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                       iconSize: 32,
                     ),
                     Text(
                       "Home",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                 ),
                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.school),
                       onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
                      },
                       iconSize: 32,
                     ),
                     Text(
                       "Subjects",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),

                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 32, color: Colors.indigo,),
                  ),
                ),

                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.event_note),
                       onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MockTest()));
                      },
                       iconSize: 32,
                     ),
                     Text(
                       "Mock Test",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),
                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.person),
                       onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MockTest()));
                      },
                       iconSize: 32,
                     ),
                     Text(
                       "Profile",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),
               ],
          ), 
        ),),


    );
  }
}