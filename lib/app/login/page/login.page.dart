import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/login/controller/login.controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController;

  LoginPage(this._loginController);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Card(
                  child: SizedBox(
                    width: size.width > 500 ? 500 : double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextField(
                            controller: _loginController.emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(primary: Colors.teal, padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                            icon: Icon(Icons.login),
                            label: Text('Login', style: TextStyle(fontSize: 16)),
                            onPressed: () {
                              _loginController.login().then((_) => Modular.to.navigate('/')).catchError((error) {
                                final snackBar = SnackBar(content: Text(error.toString()));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(32),
          ),
        ),
      ),
    );
  }
}
