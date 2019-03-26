import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.product, this.index);

 @override
 Widget build(BuildContext context) {
  return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product["image"]),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product["title"]),
                SizedBox(width: 14.0),
                PriceTag(product['price'].toString()),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          AddressTag("Plaza de Armas, Villahermosa"),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                //child: Text("Detalle"),
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => {
                      Navigator.pushNamed<bool>(context, "/product/$index")
                      //     .then((bool value) {
                      //   if (value) {
                      //     deleteProduct(index);
                      //   }
                      // })
                    },
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.favorite_border),
                onPressed: () => {
                      Navigator.pushNamed<bool>(context, "/product/$index")
                    },
              )
            ],
          )
        ],
      ),
    );
 }
}