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
  List<Widget> _historicals = [];

  @override
  void initState() {
    super.initState();
    _historicalRepository.obtain(AuthenticationService.email).then((h) {
      setState(() {
        _historicals = _renderList(h);
      });
    }).catchError((error) {
      setState(() {
        _historicals = [];
      });
    });
  }

  List<Widget> _renderList(List<OneononeHistoricalModel> historicals) {
    return historicals
        .map(
          (o) => Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text(o.leader.name),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text(o.led.name),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.today),
                      Text(o.occurrence.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.feedback),
                      Text(o.commentary),
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
      child: Column(children: _historicals),
    );
  }
}
