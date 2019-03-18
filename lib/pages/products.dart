import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
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
                title: Text("Manage Products"),
                onTap: (){
                  print("Manage Products");
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Flutter Test App3"),
        ),
        body: ProductManager());
  }
}
