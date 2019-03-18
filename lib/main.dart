import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';

main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductsAdminPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] != 'products') {
          final int index = int.parse(pathElements[2]);
          // return MaterialPageRoute(
          //   builder: (BuildContext context) =>
          //       ProductPage(products[index]["title"], products[index]["image"]),
          // );
        }

        return null;
      },
    );
  }
}