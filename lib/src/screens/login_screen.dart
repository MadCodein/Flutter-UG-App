import 'package:flutter/material.dart';
import 'package:flutter_app_ug/src/screens/create_account.dart';
import '../mixins/validation_mixin.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/ug.png'),
      ),
    );

    return Scaffold( 
    backgroundColor: Colors.white,
    body: Center(
        child: ListView(     
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: [
            logo,
            SizedBox(height: 48.0,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  emailField(),
                  SizedBox(height: 24.0,),
                  passwordField(),
                  submitButton(),
                  forgotLabel()
                  ],
                ),
              ),
          ],
         ),
        ),
     );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email, color: Colors.blue),
        // border: InputBorder.none,
        // labelText: "Email address",
        hintText: "Enter email address",
        // labelStyle: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        // hintStyle: const TextStyle(color: Colors.blue, fontSize: 15.0),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),),
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock_outline, color: Colors.blue),
        // border: InputBorder.none,
        // labelText: "Password",
        hintText: "Enter password",
        // labelStyle: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        // hintStyle: const TextStyle(color: Colors.blue, fontSize: 15.0),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),),
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      // borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      // elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          formKey.currentState.reset();
           // Navigator.of(context).pushNamed(SelectPage.tag);
          } 
      },
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

  Widget forgotLabel() {
    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              textColor: Colors.blue,
              child: Text('Create Account'),
              onPressed: () {
                Navigator.of(context).pushNamed(CreateAccount.tag);
              },
            ),
            MaterialButton(
              textColor: Colors.blue,
              child: Text('Forgot Password'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
 }