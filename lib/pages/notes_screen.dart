import 'package:flutter_application_anand/consttants.dart';
import 'package:flutter_application_anand/widgets/rounded_button.dart';
import 'package:flutter_application_anand/screens/notes_screen.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
              ),
      ),
      home: NotesScreen(),
    );
  }
}


class NotesScreen extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nh.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.display3,
                children: [
                  TextSpan(
                    text: "Sure ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
                  ),
                  TextSpan(
                    text: "&",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),),
                  
                  TextSpan(
                    text: " Short",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                fontSize: 24,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotesScreeni();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
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
                       onPressed: (){},
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
                       onPressed: (){},
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
                       onPressed: (){},
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
                       onPressed: (){},
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
