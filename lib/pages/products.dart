import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  ProductsPage(this._products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose"),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Manage Products"),
                onTap: () {
                  print("Manage Products");
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Flutter Test"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              //color: Colors.red,
              onPressed: () {},
            )
          ],
        ),
        body: ProductManager(this._products));
  }
}
