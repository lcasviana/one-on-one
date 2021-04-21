import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';
import 'package:oneonones/common/widgets/navigation_drawer.widget.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  HomePage(this._homeController);

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
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => widget._homeController.initialized
              ? ExpansionPanelList(
                  children: [
                    ...widget._homeController.dashboard!.oneonones.map(
                      (oneonone) => ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Column(
                          children: [
                            Text(oneonone.oneonone.leader.name),
                            Text(oneonone.oneonone.led.name),
                          ],
                        ),
                        body: Column(
                          children: [
                            Text(oneonone.status.lastOccurrence!.toIso8601String()),
                            Text(oneonone.status.nextOccurrence!.toIso8601String()),
                            Text(oneonone.status.isLate.toString()),
                          ],
                        ),
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
