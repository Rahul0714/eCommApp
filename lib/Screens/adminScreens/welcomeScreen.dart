import 'package:e_comm/Screens/adminScreens/admin_home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Admin Code Please!",style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.italic),),
            SizedBox(height: 25.0,),
            TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Admin Passcode",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              )
            ),
          ),
          SizedBox(height: 25.0),
          SizedBox(width: double.infinity,
          height: MediaQuery.of(context).size.height/13,
          child: RaisedButton(
            onPressed: (){
              if(_passwordController.text.isNotEmpty&&_passwordController.text=="r"){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
              }else{
                //TO DO : Display Error Msg.
               print("Error");
              }
              
            },
            child: Text("Enter",style: TextStyle(color: Colors.white,fontSize: 19.0),),
                    color: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}