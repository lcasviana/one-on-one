import 'package:flutter/material.dart';
import 'package:oneonones/features/dashboard/dashboard.feature.dart';
import 'package:oneonones/features/historical/historical.feature.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navigationIndex = 0;

  static List<Widget> _content = [
    DashboardFeature(),
    HistoricalFeature(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One-on-one\'s')),
      body: SingleChildScrollView(child: _content.elementAt(_navigationIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          const BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Início'),
          const BottomNavigationBarItem(icon: const Icon(Icons.history), label: 'Histórico'),
        ],
        onTap: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
      ),
    );
  }
}
