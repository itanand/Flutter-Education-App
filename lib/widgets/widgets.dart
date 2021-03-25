import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return RichText(
  text: TextSpan(
    text: 'Hello ',
    style: TextStyle(fontSize: 22),
    children: <TextSpan>[
      TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54)),
      TextSpan(text: ' world!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
    ],
  ),
);


}