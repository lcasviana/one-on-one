import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController = Modular.get();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (widget._homeController.user == null) widget._homeController.getUser();
    if (widget._homeController.dashboard == null) widget._homeController.getDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('One-on-one\'s')),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => widget._homeController.initialized
              ? Column(
                  children: [
                    Column(
                      children: [
                        Text(widget._homeController.dashboard!.employee.id),
                        Text(widget._homeController.dashboard!.employee.email),
                        Text(widget._homeController.dashboard!.employee.name),
                      ],
                    ),
                    ...widget._homeController.dashboard!.oneonones.map(
                      (oneonone) => Column(
                        children: [
                          Text(oneonone.oneonone.leader.name),
                          Text(oneonone.oneonone.led.name),
                        ],
                      ),
                    ),
                  ],
                )
              : Text('...'),
        ),
      ),
    );
  }
}
