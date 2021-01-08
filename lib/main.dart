import 'package:flutter/material.dart';
import 'package:oneonone/pages/home.page.dart';
import 'package:oneonone/pages/landing.page.dart';
import 'package:oneonone/pages/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One-on-one\'s',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/loading': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
