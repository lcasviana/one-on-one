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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('One-on-one\'s')),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => widget._homeController.initialized
              ? Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...widget._homeController.dashboard!.oneonones.map(
                        (compose) => Container(
                          width: size.width <= 800 ? size.width : 800,
                          child: Card(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (widget._homeController.user!.id != compose.oneonone.leader.id) Text('Leader: ${compose.oneonone.leader.name}'),
                                  if (widget._homeController.user!.id != compose.oneonone.led.id) Text('Led: ${compose.oneonone.led.name}'),
                                  Text('Last occurrence: ${DatetimeUtil.toDateText(compose.status.lastOccurrence)!}'),
                                  Text('Next occurrence: ${DatetimeUtil.toDateText(compose.status.nextOccurrence)!}'),
                                  Text('Is Late: ${compose.status.isLate! ? 'Yes' : 'No'}'),
                                  Divider(),
                                  Text('Historical:'),
                                  ...compose.historical.map(
                                    (historical) => Text('(${DatetimeUtil.toDateText(historical.occurrence)!}) ${historical.commentary!}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Text('...'),
        ),
      ),
    );
  }
}
