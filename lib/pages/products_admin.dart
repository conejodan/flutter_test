import 'package:flutter/material.dart';
import './products.dart';

import './product_create.dart';
import './product_list.dart';


class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose"),
              ),
              ListTile(
                title: Text("All Products"),
                onTap: () {
                  print("All Products");
                  Navigator.pushReplacementNamed(context,"/");
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Manage Products"),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.create), text: "Crear",),
            Tab(icon: Icon(Icons.list), text: "Lista",),
          ],),
        ),
        body: TabBarView(children: <Widget>[
          ProductCreate(),
          ProductList()
        ],),
      ),
    );
  }
}
