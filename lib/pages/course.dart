import 'package:flutter/material.dart';
import 'dart:async';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class Courses extends StatefulWidget with NavigationStates {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Dictionary'),
     centerTitle: true,
     backgroundColor: Color(0xFF1E255E),
     ),
     body: _MyList(),
    
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
        ),
        ),

    
    );
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
       itemBuilder: ( context, i) {
        return ListTile(title: Text('Dictionary'),
        subtitle: Text('Online'),
        leading: const Icon(Icons.face),
        trailing: RaisedButton(
          child: Text('Download'),
          onPressed: () {  
            downloadDialog(context).then((value){
                  print('Value is $value');
            });
          },
        
        ),
        );
      },
      
    );
  }
}
Future<bool> downloadDialog(BuildContext context){
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
             title: Text('Are You Sure?'),
          actions: <Widget>[
             FlatButton(
                 child: Text('Yes'),
                 onPressed: (){
                   Navigator.of(context).pop(false);
                 },
             ),
               FlatButton(
                 child: Text('No'),
                 onPressed: (){
                   Navigator.of(context).pop(true);
                 },
             ),
          ],
           );
        },
          );
        }