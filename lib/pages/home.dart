import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/painting.dart';
import '../components/horizontal_listview.dart';
import '../components/Products.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/cabbage.jpg'),
          AssetImage('images/chillis.jpg'),
          AssetImage('images/potatos.jpg'),
          AssetImage('images/tomato.jpg'),
        ],
        //borderRadius: true,
        autoplay: false,
        dotSize: 6.0,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        //centerTitle: true,
        title: Text('VStore', style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w300 ),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.all(Radius.circular(50.0)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.red,
                    Colors.blue
                  ])
          ),
        ),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),color: Colors.white,onPressed: (){},),
          IconButton(icon:Icon(Icons.shopping_cart),color: Colors.white,onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new Cart()));
          },),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Rahul'),
              accountEmail: Text('rahbro@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,color: Colors.red,)),
              ),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.red,
                        Colors.blue
                      ])
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap:(){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.green,),
              ),
            ),
            InkWell(
              onTap:(){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blue,),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          image_carousel,
          new Padding(padding: const EdgeInsets.all(12.0),
            child: Text('Categories'),),
          //horizonatal list view
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(16.0),
            child: Text('Recent Products'),),
          //grid view
          Flexible(
              child: Products()
          ),
        ],
      ),
    );
  }
}

