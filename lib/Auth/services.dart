import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
CollectionReference adminCollection = FirebaseFirestore.instance.collection('Admin');
//CollectionReference userPhoneCollection = FirebaseFirestore.instance.collection('UsersPhone');
CollectionReference freshCollection = FirebaseFirestore.instance.collection('Fresh');
CollectionReference pantryCollection = FirebaseFirestore.instance.collection('Pantry');
CollectionReference mobileCollection = FirebaseFirestore.instance.collection('Mobile');
CollectionReference fashionCollection = FirebaseFirestore.instance.collection('Fashion');
CollectionReference homeCollection = FirebaseFirestore.instance.collection('Home');
CollectionReference appliancesCollection = FirebaseFirestore.instance.collection('Appliances');
CollectionReference electronicsCollection = FirebaseFirestore.instance.collection('Electonics');
CollectionReference othersCollection = FirebaseFirestore.instance.collection('Others');