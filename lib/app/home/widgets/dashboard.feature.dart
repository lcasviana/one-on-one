import 'package:flutter/material.dart';
import 'package:oneonones/common/models/dashboard/oneonone_compose.model.dart';
import 'package:oneonones/features/historical_pair.feature.dart';
import 'package:oneonones/repositories/dashboard.repository.dart';
import 'package:oneonones/services/authentication.service.dart';

class DashboardFeature extends StatefulWidget {
  @override
  _DashboardFeatureState createState() => _DashboardFeatureState();
}

class _DashboardFeatureState extends State<DashboardFeature> {
  final _dashboardRepository = DashboardRepository();
  List<OneononeComposeModel>? _oneonones = [];

  @override
  void initState() {
    super.initState();
    _dashboardRepository.obtain(AuthenticationService.email!).then((dashboard) {
      setState(() {
        _oneonones = dashboard.oneonones;
      });
    }).catchError((e, s) {
      setState(() {
        _oneonones = [];
      });
    });
  }

  void _showHistoricalPair(String? leaderEmail, String? ledEmail) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Card(
          child: Column(
            children: [
              HistoricalPairFeature(leaderEmail: leaderEmail, ledEmail: ledEmail),
              IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _renderList() {
    return _oneonones!
        .map(
          (compose) => Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(children: [Icon(Icons.person), Text(compose.oneonone.leader.name)]),
                  Row(children: [Icon(Icons.person), Text(compose.oneonone.led.name)]),
                  Row(children: [Icon(Icons.history_rounded), Text(compose.oneonone.frequency.toString())]),
                  Row(children: [Icon(Icons.today), Text(compose.status.lastOccurrence!.toIso8601String().substring(0, 10))]),
                  Row(children: [Icon(Icons.event_available), Text(compose.status.nextOccurrence!.toIso8601String().substring(0, 10))]),
                  Row(children: [Icon(Icons.check), Text(compose.status.isLate!.toString())]),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.history_rounded),
                          onPressed: () => _showHistoricalPair(compose.oneonone.leader.email, compose.oneonone.led.email)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(children: _renderList()),
    );
  }
}
