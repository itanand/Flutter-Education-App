import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyApp extends StatelessWidget  with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medical Dictionary",
       debugShowCheckedModeBanner: false,
       home: MyDictionary(),
    );

  }
}

class MyDictionary extends StatefulWidget {
  @override
  _MyDictionaryState createState() => _MyDictionaryState();
}

class _MyDictionaryState extends State<MyDictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Medical Dictionary"),
        ),
        body: new _MyList()
       );
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      new Text('Dictionary 1 '),
      new Text('Dictionary 1 '),
      new Text('Dictionary 1 '),
    ],
    );
  }
}