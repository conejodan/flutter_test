import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return ProductCard(products[index], index);
  }

//  @override
//  Widget build(BuildContext context) {
//   return ListView(
//               children: products
//                   .map((element) => Card(
//                         child: Column(
//                           children: <Widget>[
//                             Image.asset("assets/food.jpg"),
//                             Text(element)
//                           ],
//                         ),
//                       ))
//                   .toList(),
//             );
//  }
  Widget _buildProductList() {
    Widget productList = Center(
      child: Text("No hay Productoss"),
    );

    if (products.length > 0) {
      productList = ListView.builder(
        //itemBuilder: _buildProductItem,
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    }

    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
