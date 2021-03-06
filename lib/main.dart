import 'package:flutter/material.dart';
import 'package:oneonones/pages/home.page.dart';
import 'package:oneonones/pages/landing.page.dart';
import 'package:oneonones/pages/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One-on-one\'s',
      initialRoute: '/landing',
      routes: {
        '/': (context) => HomePage(),
        '/landing': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
      },
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
    );
  }
}
