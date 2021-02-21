import 'package:flutter/material.dart';
import 'package:oneonones/repositories/models/oneonone.model.dart';
import 'package:oneonones/repositories/oneonone.repository.dart';
import 'package:oneonones/services/authentication/authentication.service.dart';

class DashboardFeature extends StatefulWidget {
  @override
  _DashboardFeatureState createState() => _DashboardFeatureState();
}

class _DashboardFeatureState extends State<DashboardFeature> {
  final _oneononeRepository = OneononeRepository();
  List<Widget> _oneonones = [];

  @override
  void initState() {
    super.initState();
    _oneononeRepository.obtain(AuthenticationService.email).then((o) {
      setState(() {
        _oneonones = _renderList(o);
      });
    }).catchError((error) {
      setState(() {
        _oneonones = [];
      });
    });
  }

  List<Widget> _renderList(List<OneononeModel> oneonones) {
    return oneonones
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
                      Icon(Icons.calendar_today),
                      Text(o.frequency.toString()),
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
      child: Column(children: _oneonones),
    );
  }
}
