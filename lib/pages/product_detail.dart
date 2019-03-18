import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  String title;
  String image;

  ProductPage(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(image),
              Container(
                child: Text(title),
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Back"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                padding: EdgeInsets.all(10.0),
              )
            ],
          )),
      onWillPop: () {
        print("Press Back Button!!");
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
