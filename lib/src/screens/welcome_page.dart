import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static String tag = 'welcome-page';
  
  Widget build(context) {

    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/ug.png'),
        ),
       ),
      );

      final welcome = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Welcome to UG_Course',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

       final lorem = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Follow',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final body = Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.lightBlueAccent,
            ],
          )
        ),
        child: Column(
          children: [alucard, welcome, lorem],),
      );
    return Scaffold(
      body: body,
    );
  }
}