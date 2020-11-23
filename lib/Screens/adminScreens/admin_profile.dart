import 'package:e_comm/Auth/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  PickedFile _img;
  final ImagePicker _picker = ImagePicker();
  String imgPath;
  String adminName;
  String adminEmail;
  TextEditingController _adminNameController = TextEditingController();
  TextEditingController _adminEmailController = TextEditingController();

  imgFromCamera() async {
    _img = await _picker.getImage(source: ImageSource.camera);  
    }

  imgFromGallery()  async{
    _img = await _picker.getImage(source: ImageSource.gallery);
  }

  Future<void> uploadImg() async {
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            child: Image(image: AssetImage("images/bunny_monochromatic.png"),),
            ),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: (){
            showDialog(context: context,
            builder: (_)=>AlertDialog(
              title: Text("Choose a Source"),
              actions: <Widget>[
                FlatButton(onPressed: (){
                    imgFromCamera();
                    Navigator.of(context).pop();
                    uploadImg();
                }, child: Text("Camera")),
                FlatButton(onPressed: (){
                    imgFromGallery();
                    Navigator.of(context).pop();
                    uploadImg();
                }, child: Text("Gallery")),
              ],
            ),);
          }),
          Column(
            children: [
              Text(adminName==null?"Admin_Name":adminName,style: TextStyle(
                fontSize: 17.0,
                decoration: TextDecoration.underline,
              ),),
              SizedBox(height: 20.0,),
              Text(adminEmail==null?"admin@gmail.com":adminEmail,style: TextStyle(
                fontSize: 17.0,
                decoration: TextDecoration.underline,
              ),),
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
                FlatButton(onPressed: (){
                  if(_adminEmailController!=null && _adminNameController!=null){
                    adminCollection.doc(_adminNameController.text).set({
                      'name':_adminNameController.text,
                      'email':_adminEmailController.text,
                    });
                    Navigator.of(context).pop();
                  }
                  setState(() {
                    adminName = _adminNameController.text;
                    adminEmail = _adminEmailController.text;
                  });
                }, child: Text("Save"))
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