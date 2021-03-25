import 'package:flutter/material.dart';
import 'package:flutter_application_anand/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_application_anand/pages/mocktest.dart';
import 'package:flutter_application_anand/pages/course.dart';
import 'package:flutter_application_anand/pages/homepage.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_anand/animation/FadeAnimation.dart';


class MyDownloads extends StatefulWidget with NavigationStates{
  @override
  _MyDownloadsState createState() => _MyDownloadsState();
}

class _MyDownloadsState extends State<MyDownloads> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     appBar: AppBar(
       title: Text('My Downloads'),
     centerTitle: true,
     backgroundColor: Color(0xFF1E255E),
     ),
   body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Column(  
                children: <Widget>[
                  FadeAnimation(1, Text("Uff! There is no any Saved Items", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24
                  ),)),
                ],
              ),
             FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Add.png')
                  )
                ),
              )),
              
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