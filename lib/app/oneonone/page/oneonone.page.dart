import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oneonones/app/oneonone/controller/oneonone.controller.dart';
import 'package:oneonones/common/models/dashboard/oneonone_compose.model.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/utils/datetime.util.dart';
import 'package:oneonones/common/widgets/navigation_drawer.widget.dart';

class OneononePage extends StatefulWidget {
  final OneononeController _oneononeController;

  OneononePage(this._oneononeController);

  @override
  _OneononePageState createState() => _OneononePageState(_oneononeController);
}

class _OneononePageState extends State<OneononePage> {
  final OneononeController oneononeController;

  _OneononePageState(this.oneononeController);

  @override
  void initState() {
    super.initState();
    oneononeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('One-on-one\'s')),
      drawer: NavigationDrawer(oneononeController.user),
      body: SingleChildScrollView(child: Observer(builder: (_) => oneononeController.initialized ? _main() : _loading())),
    );
  }

  Widget _loading() {
    return Text('...');
  }

  Widget _main() {
    final content = <Widget>[
      _registerOneonone(),
      _registerHistorical(),
      _dashboard(),
    ];

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: content,
      ),
    );
  }

  Widget _dashboard() {
    final dashboard = oneononeController.dashboard;
    final content = dashboard.oneonones.map((compose) => _compose(compose)).toList();
    return Column(children: content);
  }

  Widget _compose(OneononeComposeModel compose) {
    final size = MediaQuery.of(context).size;
    final user = oneononeController.user;
    final maxWidth = 600.0;

    final content = <Widget>[
      if (user.id != compose.oneonone.leader.id) Text('Leader: ${compose.oneonone.leader.name}'),
      if (user.id != compose.oneonone.led.id) Text('Led: ${compose.oneonone.led.name}'),
      Text('Last occurrence: ${DatetimeUtil.toDateText(compose.status.lastOccurrence)}'),
      Text('Next occurrence: ${DatetimeUtil.toDateText(compose.status.nextOccurrence)}'),
      Text('Is Late: ${compose.status.isLate == true ? 'Yes' : 'No'}'),
      Text('Historical:'),
      ...compose.historical.map((h) => Text('(${DatetimeUtil.toDateText(h.occurrence)}) ${h.commentary}')),
    ];

    return Container(
      width: size.width <= maxWidth ? size.width : maxWidth,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: content),
        ),
      ),
    );
  }

  Widget _registerOneonone() {
    final oneononeController = widget._oneononeController;
    final size = MediaQuery.of(context).size;
    final maxWidth = 600.0;
    final content = <Widget>[
      DropdownButton<EmployeeModel>(
        isExpanded: true,
        value: oneononeController.oneononeInsertPartner,
        items: [
          DropdownMenuItem<EmployeeModel>(child: Text(''), value: null),
          ...oneononeController.employees.map((e) => DropdownMenuItem<EmployeeModel>(child: Text(e.name), value: e)),
        ],
        onChanged: (value) => oneononeController.oneononeInsertPartner = value,
      ),
      DropdownButton<bool>(
        isExpanded: true,
        value: oneononeController.oneononeInsertLeader,
        items: [
          DropdownMenuItem<bool>(child: Text(''), value: null),
          ...[true, false].map((v) => DropdownMenuItem<bool>(child: Text(v ? 'Leader' : 'Led'), value: v)),
        ],
        onChanged: (value) => oneononeController.oneononeInsertLeader = value,
      ),
    ];

    return Container(
      width: size.width <= maxWidth ? size.width : maxWidth,
      child: Column(
        children: content,
      ),
    );
  }

  Widget _registerHistorical() {
    return Column();
  }
}
