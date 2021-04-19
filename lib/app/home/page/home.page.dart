import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController = Modular.get();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('One-on-one\'s')),
      body: SingleChildScrollView(child: Container()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._homeController.navigationIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historical'),
        ],
        onTap: (index) => widget._homeController.setNavigationIndex(index),
      ),
    );
  }
}
