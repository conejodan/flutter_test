import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => new _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage("assets/background.jpg"),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 60.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        setState(() {
                          _emailValue = value;
                        });
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                      onChanged: (String value) {
                        setState(() {
                          _passwordValue = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text("Remember"),
                      value: _rememberValue,
                      onChanged: (bool value) {
                        setState(() {
                          _rememberValue = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/products");
                      },
                    )
                  ],
                )),
          )),
    );
  }
}
