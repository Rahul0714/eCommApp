import 'package:flutter/cupertino.dart';

class Profile extends ChangeNotifier{
  String name;
  String email;
  String img;

  changeValues(String name, String email){
    this.name = name;
    this.email = email;
    notifyListeners();
  }
  changeProfile(String img){
    this.img = img;
    notifyListeners();
  }
}