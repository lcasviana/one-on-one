import 'package:flutter/material.dart';
import 'package:oneonones/services/authentication/authentication.service.dart';
import 'package:oneonones/services/navigation/navigation.service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

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
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                          ),
                          // TextField(controller: _passwordController, obscureText: true),
                          SizedBox(height: 16),
                          ButtonTheme(
                            colorScheme: ColorScheme.dark(),
                            child: RaisedButton(
                              child: Padding(child: Text('Login'), padding: EdgeInsets.all(8)),
                              onPressed: () {
                                AuthenticationService.login(_emailController.text)
                                    .then((result) => result ? NavigationService.navigate(context, '/') : null)
                                    .catchError((error) {
                                  final snackBar = SnackBar(content: Text(error.toString()));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                });
                              },
                            ),
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
