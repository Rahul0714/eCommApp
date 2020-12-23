import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/userScreen/intro_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:NavigateUser(),
    );
  }
}

class NavigateUser extends StatefulWidget {
  @override
  _NavigateUserState createState() => _NavigateUserState();
}

class _NavigateUserState extends State<NavigateUser> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(),
    );
  }
}