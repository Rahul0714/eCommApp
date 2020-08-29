import 'package:flutter/material.dart';
import 'package:tryouts/components/auth.dart';
import '../pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          splashColor: Colors.grey  ,
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
          child: Text("Google Sign In"),
          onPressed: ()=>signInWithGoogle().whenComplete(() =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()))),
        ),
      ),
    );
  }
}
