import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
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
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          Text(titleValue),
          TextField(
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          Text(descriptionValue),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          Text(priceValue.toString()),
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
