import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oneonones/app/home/controller/home.controller.dart';
import 'package:oneonones/common/utils/datetime.util.dart';
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
              ? Column(
                  children: [
                    ...widget._homeController.dashboard!.oneonones.map(
                      (compose) => Card(
                        child: Column(
                          children: [
                            Text(compose.oneonone.leader.name),
                            Text(compose.oneonone.led.name),
                            Text(DatetimeUtil.toDateText(compose.status.lastOccurrence)!),
                            Text(DatetimeUtil.toDateText(compose.status.nextOccurrence)!),
                            Text(compose.status.isLate.toString()),
                            ...compose.historical.map(
                              (historical) => Row(
                                children: [
                                  Text(DatetimeUtil.toDateText(historical.occurrence)!),
                                  Text(historical.commentary!),
                                ],
                              ),
                            ),
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
