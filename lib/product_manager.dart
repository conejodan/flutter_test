import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({String this.startingProduct});

  @override
  _ProductManagerState createState() => new _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    // TODO: implement initState
    if(widget.startingProduct != null){
      _products.add({"title":widget.startingProduct, "image": "assets/food.jpg"});
    }
    super.initState();
  }

  _addProduct(String value) {
    setState(() {
      _products.add({"title":"Producto " + _products.length.toString(), "image": "assets/food.jpg"});
    });
  }

  _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
          child: Products(_products, deleteProduct:_deleteProduct),
        ),
        
      ],
    );
  }
}
