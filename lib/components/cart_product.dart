import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  var products_on_cart = [
    {
      "name": "Chillis",
      "picture": "images/chillis.jpg",
      "price": "80",
      "quantity": 2,
    },
    {
      "name": "Potato",
      "picture": "images/potatos.jpg",
      "price": "120",
      "quantity": 3,
    },
  ];
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products_on_cart.length,
      itemBuilder: (context, index){
        return SingleCartProduct(
          cart_product_name: widget.products_on_cart[index]["name"],
          cart_product_price: widget.products_on_cart[index]["price"],
          cart_product_qty: widget.products_on_cart[index]["quantity"],
          cart_product_pict: widget.products_on_cart[index]["picture"],
        );
    });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_product_name;
  final cart_product_pict;
  final cart_product_price;
  final cart_product_qty;

  SingleCartProduct({
  this.cart_product_name,
    this.cart_product_pict,
    this.cart_product_price,
    this.cart_product_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Image.asset(cart_product_pict,fit: BoxFit.cover,),
          title: Text(cart_product_name),
          subtitle: Column(
            children: <Widget>[
//            Row(
//              children: <Widget>[
//                P
//              ],
//            )
            Container(
              alignment: Alignment.topLeft,
              child: Text("₹ "+cart_product_price,
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            ],
          ),
          trailing: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                    child: IconButton(icon:Icon(Icons.arrow_drop_up), onPressed: (){},),
                ),
                Flexible(
                      child: Text("$cart_product_qty",),
                  ),
                Flexible(
                    child: IconButton(icon:Icon(Icons.arrow_drop_down), onPressed: (){},),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
