import 'package:e_comm/Auth/services.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}
class Item{
const Item(this.name,this.icon);
 final String name;
 final Icon icon;
}

class _AddItemState extends State<AddItem> {

  TextEditingController _pNameController = TextEditingController();
  TextEditingController _pPriceController = TextEditingController();
  TextEditingController _pQtyController = TextEditingController();

  String category = "Fresh";
  List products = [
    const Item('Fresh',Icon(Icons.shopping_bag)),
    const Item('Pantry',Icon(Icons.shopping_basket)),
    const Item('Mobile',Icon(Icons.mobile_friendly)),
    const Item('Fashion',Icon(Icons.collections)),
    const Item('Home',Icon(Icons.home)),
    const Item('Appliances',Icon(Icons.shopping_bag)),
    const Item('Electronics',Icon(Icons.shopping_basket)),
    const Item('Others',Icon(Icons.shopping_bag)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add Item",style: TextStyle(fontSize: 20.0),),
              SizedBox(height: 20.0,),
              Container(
                //color: Colors.orange[500],
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/1.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.blue[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height/25),
                    Row(
                      children: [
                        Text("Category:",style: TextStyle(fontSize: 20.0),),
                        DropdownButton<Item>(
                          items: products.map<DropdownMenuItem<Item>>((product){
                            return DropdownMenuItem<Item>(
                              value: product,
                              child: Row(children: [
                              product.icon,
                              SizedBox(width: 10.0,),
                              Text(product.name),
                            ],));
                          }).toList(), 
                          onChanged: (Item newValue){
                            print(newValue.name);
                            setState(() {
                              newValue = newValue;
                              category = newValue.name;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/25),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                      child: TextField(
                        controller: _pNameController,
                        decoration: InputDecoration(
                          labelText: "Product Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/25),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                      child: TextField(
                        controller: _pPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Product Price",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/25),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                      child: TextField(
                        controller: _pQtyController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Product Qty",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    InkWell(
                      onTap: ()async{
                          switch(category){
                            case "Fresh":{
                              try{
                                freshCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Pantry":{
                              try{
                                pantryCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Mobile":{
                              try{
                                mobileCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Fashion":{
                              try{
                                fashionCollection.doc(_pNameController.text).set({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                });
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Home":{
                              try{
                                homeCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Appliances":{
                              try{
                                appliancesCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Electronics":{
                              try{
                                electronicsCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                            case "Others":{
                              try{
                                othersCollection.doc(_pNameController.text).set(({
                                  'product_name':_pNameController.text,
                                  'product_price':_pPriceController.text,
                                  'product_qty':_pQtyController.text
                                }));
                              }catch(e){
                                var snackbar = SnackBar(content: Text(e.toString()));
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                            break;
                          }
                        _pNameController.text = " ";
                        _pPriceController.text = " ";
                        _pQtyController.text = " ";
                      },
                      child: Container(
                        child: Center(child: Text("Add",style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue,
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}