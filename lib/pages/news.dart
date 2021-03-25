import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';


class News extends StatelessWidget with  NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 400,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              ),
            ],
            gradient: LinearGradient(colors: [Colors.red, Colors.orange],
            )
           
          ),
          child: Text("I am Anand", ),
        ),
      ),
    );
  }
}