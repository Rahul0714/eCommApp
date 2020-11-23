import 'package:e_comm/Screens/adminScreens/add_item.dart';
import 'package:e_comm/Screens/adminScreens/change_item.dart';
import 'package:flutter/material.dart';

import 'admin_profile.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(icon: Icon(Icons.history), onPressed: (){}),
        IconButton(icon: Icon(Icons.logout), onPressed: (){}),
      ],),
      drawer: Drawer(
        child:ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName:Text("Admin_Name"), 
              accountEmail: Text("admin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/bunny_monochromatic.png"),
              ),),
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Item"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItem()));
                },
              ),
            ListTile(
                leading: Icon(Icons.update),
                title: Text("Change Item"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeItem()));
                },
              ),
             ListTile(
                leading: Icon(Icons.history_sharp),
                title: Text("History"),
              ),
             ListTile(
                leading: Icon(Icons.photo),
                title: Text("Admin Profile"),
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProfile()));
                },
              ),
             ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign Out"),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(300,0,0,10.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItem()));
          },),
      ),
      body: Center(
        child: Text("All Info",style: TextStyle(fontSize: 20.0),),),
    );
  }
}