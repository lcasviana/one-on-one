import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One-on-one\'s',
      initialRoute: '/landing',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      themeMode: ThemeMode.dark,
    ).modular();
  }
}
