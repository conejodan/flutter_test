import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;

  ProductPage(this.title, this.image);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("estas seguro?"),
            content: Text("Esto es un texto que bla bla bla"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Eliminar"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

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
              ),
              Container(
                child: RaisedButton(
                  child: Text("Alert"),
                  onPressed: () => _showWarningDialog(context),
                ),
                padding: EdgeInsets.all(10.0),
              ),
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
