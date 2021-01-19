import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController(), _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(controller: _username),
                TextField(controller: _password, obscureText: true),
                ButtonTheme(colorScheme: ColorScheme.dark(), child: RaisedButton(onPressed: () {}, child: Text('Login'))),
              ],
            ),
            padding: EdgeInsets.all(32),
          ),
        ),
      ),
    );
  }
}
