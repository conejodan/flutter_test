import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage({this.addProduct, this.product, this.updateProduct, this.productIndex});

  @override
  _ProductEditPageState createState() => new _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    "image": "assets/food.jpg"
  };
  String _titleValue = "";
  String _descriptionValue = "";
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Title"),
      initialValue: widget.product != null ? widget.product["title"] : '',
      validator: (String value) {
        if (value.isEmpty) {
          return "Title is required";
        }
      },
      //onChanged: (String value) {
      onSaved: (String value) {
        // setState(() {
        //   _titleValue = value;
        // });
        _formData["title"] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Description"),
      initialValue: widget.product != null ? widget.product["description"] : '',
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty) {
          return "Description is required";
        }
      },
      //onChanged: (String value) {
      onSaved: (String value) {
        // setState(() {
        //   _descriptionValue = value;
        // });
        _formData["description"] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      initialValue:
          widget.product != null ? widget.product["price"].toString() : '',
      validator: (String value) {
        if (value.isEmpty) {
          return "Price is required";
        }
      },
      //onChanged: (String value) {
      onSaved: (String value) {
        // setState(() {
        //   _priceValue = double.parse(value);
        // });
        _formData["price"] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      "title": _titleValue,
      "description": _descriptionValue,
      "price": _priceValue,
      "image": "assets/food.jpg"
    };
    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(_formData, widget.productIndex);
    }

    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final deviceWith = MediaQuery.of(context).size.width;
    final targetWith = deviceWith > 550.0 ? 500.00 : deviceWith * 0.95;
    final targetPadding = deviceWith - targetWith;

    Widget editPage = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
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
        ),
      ),
    );

    return widget.product == null
        ? editPage
        : Scaffold(
            appBar: AppBar(
              title: Text("Edit Product"),
            ),
            body: editPage,
          );
  }
}
