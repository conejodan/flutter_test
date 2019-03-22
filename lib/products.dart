import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]["image"]),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]["title"],
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 14.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Text(
                    "\$${products[index]['price']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Detalle"),
                onPressed: () => {
                      Navigator.pushNamed<bool>(context, "/product/$index")
                      //     .then((bool value) {
                      //   if (value) {
                      //     deleteProduct(index);
                      //   }
                      // })
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
