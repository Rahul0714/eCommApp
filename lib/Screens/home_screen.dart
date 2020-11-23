import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STORE_NAME"),
        actions: [
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
          int _count =0;
          FirebaseAuth.instance.signOut();
          Navigator.popUntil(context, (route) {
            return _count++ ==2;
          });
        }),
      ],
      ),
      drawer: Drawer(
        child:ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName:Text("User_Name"), 
              accountEmail: Text("user@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/bunny_monochromatic.png"),
              ),),
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Item"),
                onTap: (){
                  
                },
              ),
            ListTile(
                leading: Icon(Icons.update),
                title: Text("Change Item"),
                onTap: (){
            
                },
              ),
             ListTile(
                leading: Icon(Icons.history_sharp),
                title: Text("History"),
              ),
             ListTile(
                leading: Icon(Icons.photo),
                title: Text("Admin Profile"),
                onTap: (){
        
                },
              ),
             ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign Out"),
              ),
          ],
        ),
      ),
      body: Center(
        child: Text("Hola"),
      ),
    );
  }
}