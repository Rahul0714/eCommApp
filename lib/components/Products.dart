import 'package:flutter/material.dart';

import '../pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Tomato",
      "picture": "images/tomato.jpg",
      "price": "100",
    },
    {
      "name": "Potato",
      "picture": "images/potatos.jpg",
      "price": "120",
    },
    {
      "name": "Chillis",
      "picture": "images/chillis.jpg",
      "price": "80",
    },
    {
      "name": "Cabbage",
      "picture": "images/cabbage.jpg",
      "price": "60",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext contex, int index){
        return SingleProd(
          product_name: product_list[index]['name'],
          product_pict: product_list[index]['picture'],
          product_price: product_list[index]['price'],
        );
      });
  }
}

class SingleProd extends StatelessWidget {
  final product_name;
  final product_pict;
  final product_price;

  SingleProd({
    this.product_name,
    this.product_pict,
    this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_name, child: Material(
        child: InkWell(
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder:
          (context)=> new ProductDetails(
            product_detail_name: product_name,
            product_detail_pict: product_pict,
            product_detail_price: product_price,
          ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(product_name,style: TextStyle(fontWeight: FontWeight.w500,),),
                title: Text("₹ "+ product_price ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              ),
            ),
            child: Image.asset(product_pict,
            fit: BoxFit.cover,),
          ),
        ),
      ),),
    );
  }
}

