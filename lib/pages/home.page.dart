import 'package:flutter/material.dart';
import 'package:oneonones/features/dashboard/dashboard.feature.dart';
import 'package:oneonones/features/historical/historical.feature.dart';
import 'package:oneonones/services/authentication/authentication.service.dart';
import 'package:oneonones/services/navigation/navigation.service.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            if (AuthenticationService.name != null)
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AuthenticationService.name),
                    Text(AuthenticationService.email),
                  ],
                ),
              ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                AuthenticationService.logout().then((result) => result ? NavigationService.navigate(context, '/login') : null).catchError((error) {});
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: _content.elementAt(_navigationIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          const BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Dashboard'),
          const BottomNavigationBarItem(icon: const Icon(Icons.history), label: 'Historical'),
        ],
        onTap: (index) => setState(() => _navigationIndex = index),
      ),
    );
  }
}
