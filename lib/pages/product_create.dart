import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;

  ProductCreate(this.addProduct);

  @override
  _ProductCreateState createState() => new _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  String titleValue = "";
  String descriptionValue = "";
  double priceValue;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Product Title"),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          Text(titleValue),
          TextField(
            decoration: InputDecoration(labelText: "Product Description"),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          Text(descriptionValue),
          TextField(
            decoration: InputDecoration(labelText: "Product Price"),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          Text(priceValue.toString()),
          RaisedButton(child: Text("Guardar"),onPressed: (){
            final Map<String, dynamic> product = {
              "title" :titleValue,
              "description" :descriptionValue,
              "price" :priceValue,
              "image": "assets/food.jpg"
            };
            widget.addProduct(product);
          },),
          Center(
            child: RaisedButton(
              child: Text("Modal"),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Text("Modal"),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
