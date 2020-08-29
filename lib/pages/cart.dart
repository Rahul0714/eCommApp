import 'dart:math';

import 'package:flutter/material.dart';
import '../components/cart_product.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        //centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('My Cart', style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w300 ),),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),color: Colors.white,onPressed: (){},),
        ],
      ),
      body: CartProduct(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text(" ₹"),
              ),
            ),
            Expanded(
              child: MaterialButton(onPressed: (){},
              child: Text("Check Out"),
              color: Colors.red,
              textColor: Colors.white,),
            )
          ],
        ),
      )
    );
  }
}
