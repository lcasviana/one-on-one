import 'package:flutter/material.dart';
import 'package:oneonones/repositories/historical.repository.dart';
import 'package:oneonones/common/models/oneonone_historical.model.dart';
import 'package:oneonones/services/authentication.service.dart';

class HistoricalFeature extends StatefulWidget {
  @override
  _HistoricalFeatureState createState() => _HistoricalFeatureState();
}

class _HistoricalFeatureState extends State<HistoricalFeature> {
  final _historicalRepository = HistoricalRepository();
  List<OneononeHistoricalModel> _historical = [];

  @override
  void initState() {
    super.initState();
    _historicalRepository.obtain(AuthenticationService.email).then((historical) {
      setState(() {
        _historical = historical;
      });
    }).catchError((error) {
      setState(() {
        _historical = [];
      });
    });
  }

  List<Widget> _renderList() {
    return _historical
        .map(
          (o) => Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(children: [Icon(Icons.person), Text(o.leader.name)]),
                  Row(children: [Icon(Icons.person), Text(o.led.name)]),
                  Row(children: [Icon(Icons.today), Text(o.occurrence?.toIso8601String()?.substring(0, 10))]),
                  Row(children: [Icon(Icons.feedback), Text(o.commentary)]),
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
