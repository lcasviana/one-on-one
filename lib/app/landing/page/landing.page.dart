import 'package:flutter/material.dart';
import 'package:oneonones/app/landing/controller/landing.controller.dart';

class LandingPage extends StatefulWidget {
  final LandingController _landingController;

  LandingPage(this._landingController);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    widget._landingController.init();
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
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
