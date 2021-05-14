import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oneonones/app/oneonone/controller/oneonone.controller.dart';
import 'package:oneonones/app/oneonone/widgets/oneonone_insert.widget.dart';
import 'package:oneonones/common/utils/datetime.util.dart';
import 'package:oneonones/common/widgets/navigation_drawer.widget.dart';

class OneononePage extends StatefulWidget {
  final OneononeController _oneononeController;

  OneononePage(this._oneononeController);

  @override
  _OneononePageState createState() => _OneononePageState();
}

class _OneononePageState extends State<OneononePage> {
  @override
  void initState() {
    super.initState();
    final oneononeController = widget._oneononeController;
    if (oneononeController.dashboard == null) oneononeController.getDashboard();
  }

  @override
  Widget build(BuildContext context) {
    final oneononeController = widget._oneononeController;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('One-on-one\'s')),
      drawer: NavigationDrawer(oneononeController.user),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => oneononeController.initialized
              ? Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OneononeInsert(),
                      ...oneononeController.dashboard!.oneonones.map(
                        (compose) => Container(
                          width: size.width <= 800 ? size.width : 800,
                          child: Card(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (oneononeController.user.id != compose.oneonone.leader.id) Text('Leader: ${compose.oneonone.leader.name}'),
                                  if (oneononeController.user.id != compose.oneonone.led.id) Text('Led: ${compose.oneonone.led.name}'),
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
