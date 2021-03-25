import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class AboutUs extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "About Us",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}