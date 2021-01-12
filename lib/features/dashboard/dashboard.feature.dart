import 'package:flutter/material.dart';

class DashboardFeature extends StatefulWidget {
  @override
  _DashboardFeatureState createState() => _DashboardFeatureState();
}

class _DashboardFeatureState extends State<DashboardFeature> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('PRÓXIMO ENCONTRO'),
                  Text('13 dez 2020'),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text('Fulano Silva'),
                    ],
                  ),
                  Text('Faltam 3 dias'),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
