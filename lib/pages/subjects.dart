import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart'; 

class Subjects extends StatefulWidget with NavigationStates {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
     return Center(
      child: Text(
        "Subjects",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}