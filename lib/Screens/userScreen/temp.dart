import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment .center,
          children: [
            Text(FirebaseAuth.instance.currentUser.toString()),
            Text(FirebaseAuth.instance.currentUser.displayName),
            Text(FirebaseAuth.instance.currentUser.phoneNumber),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: (){
              FirebaseAuth.instance.signOut();
            },),
          ],
        ),
      ),
    );
  }
}