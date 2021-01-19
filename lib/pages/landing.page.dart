import 'package:flutter/material.dart';
import 'package:oneonones/core/authentication/authentication.service.dart';
import 'package:oneonones/core/navigation/navigation.service.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    AuthenticationService.autoAuthenticate()
        .then((value) => value ? Navigation.navigate(context, '/') : Navigation.navigate(context, '/login'))
        .catchError((err) => Navigation.navigate(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        ),
      ),
    );
  }
}
