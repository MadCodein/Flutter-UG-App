import 'package:flutter/material.dart';
import 'package:flutter_app_ug/src/screens/login_screen.dart';
import 'package:flutter_app_ug/src/screens/create_account.dart';

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    LoginPage.tag: (context) => LoginPage(),
    CreateAccount.tag: (context) => CreateAccount(),
  };

  Widget build(context) {
    return MaterialApp(
      title: "UG Application",
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      
      home: LoginPage(),

      routes: routes,
    );
  }
}