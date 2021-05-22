import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oneonones/app/oneonone/controller/oneonone.controller.dart';
import 'package:oneonones/common/enumerations/frequency.enum.dart';
import 'package:oneonones/common/models/dashboard/oneonone_compose.model.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/utils/datetime.util.dart';
import 'package:oneonones/common/utils/frequency.util.dart';
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
      Container(
        padding: EdgeInsets.only(bottom: 16),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Who is your mate?',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          isEmpty: oneononeController.oneononeInsertPartner == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<EmployeeModel>(
              value: oneononeController.oneononeInsertPartner,
              isDense: true,
              onChanged: (partner) => oneononeController.oneononeInsertPartner = partner,
              items: [
                DropdownMenuItem<EmployeeModel>(child: Text(''), value: null),
                ...oneononeController.employees.map((e) => DropdownMenuItem<EmployeeModel>(child: Text(e.name), value: e)),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 16),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Is this person your leader or your led?',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          isEmpty: oneononeController.oneononeInsertLeader == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<bool>(
              value: oneononeController.oneononeInsertLeader,
              isDense: true,
              onChanged: (leader) => oneononeController.oneononeInsertLeader = leader,
              items: [
                DropdownMenuItem<bool>(child: Text(''), value: null),
                ...[true, false].map((v) => DropdownMenuItem<bool>(child: Text(v ? 'Leader' : 'Led'), value: v)),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 16),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Which frequency you will meet?',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          isEmpty: oneononeController.oneononeInsertFrequency == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FrequencyEnum>(
              value: oneononeController.oneononeInsertFrequency,
              isDense: true,
              onChanged: (frequency) => oneononeController.oneononeInsertFrequency = frequency,
              items: [
                DropdownMenuItem<FrequencyEnum>(child: Text(''), value: null),
                ...FrequencyEnum.values.map((e) => DropdownMenuItem<FrequencyEnum>(child: Text(FrequencyUtil.toText(e)), value: e)),
              ],
            ),
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          if (oneononeController.oneononeInsertPartner == null ||
              oneononeController.oneononeInsertLeader == null ||
              oneononeController.oneononeInsertFrequency == null) return null;
          oneononeController.oneononeInsert(
            oneononeController.oneononeInsertLeader! ? oneononeController.oneononeInsertPartner!.id : oneononeController.user.id,
            oneononeController.oneononeInsertLeader! ? oneononeController.user.id : oneononeController.oneononeInsertPartner!.id,
            oneononeController.oneononeInsertFrequency!,
          );
        },
        child: Text('Register one-on-one'),
      ),
    ];

    return Container(
      width: size.width <= maxWidth ? size.width : maxWidth,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(children: content),
        ),
      ),
    );
  }

  Widget _registerHistorical() {
    return Column();
  }
}
