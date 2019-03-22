import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;

  ProductCreate(this.addProduct);

  @override
  _ProductCreateState createState() => new _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  String _titleValue = "";
  String _descriptionValue = "";
  double _priceValue;

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
                _titleValue = value;
              });
            },
          ),
          //Text(_titleValue),
          TextField(
            decoration: InputDecoration(labelText: "Product Description"),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          //Text(_descriptionValue),
          TextField(
            decoration: InputDecoration(labelText: "Product Price"),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          //Text(priceValue.toString()),
          SizedBox(
            height: 13.0,
          ),
          RaisedButton(
            child: Text("Guardar"),
            textColor: Colors.white,
            onPressed: () {
              final Map<String, dynamic> product = {
                "title": _titleValue,
                "description": _descriptionValue,
                "price": _priceValue,
                "image": "assets/food.jpg"
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, "/products");
            },
          ),
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
