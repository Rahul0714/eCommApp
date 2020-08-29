import 'package:flutter/material.dart';
import 'package:tryouts/pages/cart.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_pict;
  final product_detail_price;

    ProductDetails({
      this.product_detail_name,
      this.product_detail_pict,
      this.product_detail_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        //centerTitle: true,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> new HomePage()));
            },
            child: Text('VStore',
          style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w300 ),)),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.shopping_cart),color: Colors.white,onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context)=> new Cart()));
          },),
        ],
      ),
      body: ListView(
        children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(0.0),
             child: Container(
                height: 300.0,
                child: GridTile(
                  child: Container(
                    color: Colors.white70,
                    child: Image.asset(widget.product_detail_pict),
                  ),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(widget.product_detail_name,
                        style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 20.0),),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("₹ "+widget.product_detail_price),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
           ),
          Row(
            children: <Widget>[
              //kilo button
              Expanded(
                child: MaterialButton(onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: Text("Quantity"),
                      content: Text("Qty in Kilos"),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: Text("Close"),)
                      ],
                    );
                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                  elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Quantity")
                    ),
                    Expanded(
                        child: Icon(Icons.arrow_drop_down)
                    ),
                  ],
                ),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.3,
                  child: Text("Buy Now"),
                ),
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: (){},)
            ],
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text("Lorem ipsum dolor sit amet,"
                " consectetur adipiscing elit. Suspendisse convallis sit amet eros a finibus. "
                "Fusce nec ipsum ut lacus sodales vulputate. Aliquam eu urna commodo, efficitur mauris et, porta lorem."
                " Curabitur ipsum risus, dapibus ut ex at, commodo varius erat. Interdum et malesuada fames ac ante ipsum primis in faucibus."
                " Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent iaculis interdum condimentum. Suspendisse porttitor lorem ex, "
                "ut dapibus turpis accumsan eu."),
          )

        ],
      ),
    );
  }
}
