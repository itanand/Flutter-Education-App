import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marquee',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(top: 50.0),
          children: [
            _buildMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'There once was a boy who told this story about a boy: ', 
    );
  }

  

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.transparent, child: child),
    );
  }
}