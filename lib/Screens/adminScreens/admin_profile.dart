import 'dart:io';
import 'package:e_comm/Auth/services.dart';
import 'package:e_comm/Screens/adminScreens/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  final ImagePicker _picker = ImagePicker();
  String imgPath;
  String adminName,adminEmail;
  TextEditingController _adminNameController = TextEditingController();
  TextEditingController _adminEmailController = TextEditingController();

  Future<String> imgFromCamera() async {
    var img = await _picker.getImage(source: ImageSource.camera);
    File file = File(img.path);
    FirebaseStorage.instance.refFromURL('gs://e-commerce-app-1fbb6.appspot.com')
    .child('image/admin.jpg').putFile(file);

    imgPath = await FirebaseStorage.instance.refFromURL('gs://e-commerce-app-1fbb6.appspot.com/')
    .child('image/admin.jpg').getDownloadURL();
    return imgPath;
    }

  Future<String> imgFromGallery()  async{
    var img = await _picker.getImage(source: ImageSource.gallery);
    File file = File(img.path);
    FirebaseStorage.instance.refFromURL('gs://e-commerce-app-1fbb6.appspot.com')
    .child('image/admin.jpg').putFile(file);

    imgPath = await FirebaseStorage.instance.refFromURL('gs://e-commerce-app-1fbb6.appspot.com/')
    .child('image/admin.jpg').getDownloadURL();
    return imgPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Change Profile",style: TextStyle(fontSize: 25.0),),
            SizedBox(height: MediaQuery.of(context).size.height/9,),
          
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/bunny_monochromatic.png'),
              ),
          
          IconButton(icon: Icon(Icons.camera_alt), onPressed: (){
              showDialog(context: context,
              builder: (_)=>AlertDialog(
                title: Text("Choose a Source"),
                actions: <Widget>[
                  Consumer<Profile>(
                    builder: (context,profile,child)=>FlatButton(onPressed: ()async {
                        profile.changeProfile(await imgFromCamera());
                        adminCollection.doc(profile.name).set({
                          'name':profile.name,
                          'email':profile.email,
                          'image': profile.img, 
                        });
                        Navigator.of(context).pop();
                    }, child: Text("Camera")),
                  ),
                  Consumer<Profile>(
                    builder: (context,profile,child)=>FlatButton(onPressed: ()async{
                        profile.changeProfile(await imgFromGallery());
                        adminCollection.doc(profile.name).set({
                          'name':profile.name,
                          'email':profile.email,
                          'image': profile.img,
                        });
                        Navigator.of(context).pop();
                    }, child: Text("Gallery"),
                    ),
                  ),
                ],
              ),);
            }),
          Column(
            children: [
              Consumer<Profile>(
                builder: (context,profile,child)=>Text(profile.name==null?"Admin_Name"
                :profile.name,style: TextStyle(fontSize: 17.0,
                  decoration: TextDecoration.underline,
                ),),
              ),
              SizedBox(height: 20.0,),
              Consumer<Profile>(
                builder: (context,profile,child)=>Text(profile.email==null?"admin@gmail.com"
                :profile.email,style: TextStyle(fontSize: 17.0,
                  decoration: TextDecoration.underline,
                ),),
              ),
              SizedBox(height: 20.0,),
          FlatButton(onPressed: (){
            showDialog(context: context,
            builder: (_)=> AlertDialog(
              title: Text("Enter Name and Email"),
              content: Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  TextField(
                      controller: _adminNameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    TextField(
                      controller: _adminEmailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                ],),
              ),
              actions: <Widget>[
                Consumer<Profile>(
                  builder: (context,profile,child)=> FlatButton(onPressed: (){
                    if(_adminEmailController!=null && _adminNameController!=null){
                      adminCollection.doc(profile.name).set({
                        'name':_adminNameController.text,
                        'email':_adminEmailController.text,
                      });
                      Navigator.of(context).pop();
                    }
                    profile.changeValues(_adminNameController.text, _adminEmailController.text);
                  }, child: Text("Save")),
                )
              ],
            ),);
          }, child: Text("Edit"),
          color: Colors.blue[200],),
        ], ),
        ],),
      )
    );
  }
}