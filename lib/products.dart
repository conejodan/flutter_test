import 'package:flutter/material.dart';
import './pages/product_detail.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]["image"]),
          Text(products[index]["title"]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Detalle"),
                onPressed: () => {
                      Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProductPage(products[index]["title"], products[index]["image"]),
                        ),
                      ).then((bool value){
                        if(value){
                          deleteProduct(index);
                        }
                      })
                    },
              )
            ],
          )
        ],
      ),
    );
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
        itemBuilder: _buildProductItem,
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
