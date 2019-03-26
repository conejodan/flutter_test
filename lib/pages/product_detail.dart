import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final String description;

  ProductPage(this.title, this.image, this.price, this.description);

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

  Widget _buildAddressPriceRow(){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Plaza de Armas, Villahermosa",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      "|",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "\$" + price.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              );
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
                child: TitleDefault(title),
                padding: EdgeInsets.all(10.0),
              ),
              _buildAddressPriceRow(),
              Container(
                padding: EdgeInsets.all(10.0),
                //alignment: Alignment.center,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
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
