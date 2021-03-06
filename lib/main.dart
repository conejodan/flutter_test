import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product_detail.dart';

main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [
    {
      'title': "Chocolate",
      'description':
          "This is a great chocolate that you dont need to capture anymore",
      'price': 25.0,
      'image': "assets/food.jpg",
    }
  ];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _updateProduct(Map<String, dynamic> product, int index) {
    setState(() {
      _products[index] = product;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.purpleAccent,
          buttonTheme: ButtonThemeData(buttonColor: Colors.redAccent)),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdminPage(_addProduct, _updateProduct, _deleteProduct, _products)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] != 'products') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                  _products[index]["title"],
                  _products[index]["image"],
                  _products[index]["price"],
                  _products[index]["description"],
                ),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
