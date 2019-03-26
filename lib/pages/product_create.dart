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

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Title"),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Description"),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      "title": _titleValue,
      "description": _descriptionValue,
      "price": _priceValue,
      "image": "assets/food.jpg"
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          //Text(_titleValue),
          _buildDescriptionTextField(),
          //Text(_descriptionValue),
          _buildPriceTextField(),
          //Text(priceValue.toString()),
          SizedBox(
            height: 13.0,
          ),
          RaisedButton(
            child: Text("Guardar"),
            textColor: Colors.white,
            onPressed: _submitForm,
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
