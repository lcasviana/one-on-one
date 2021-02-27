import 'package:flutter/material.dart';
import 'package:oneonones/services/authentication.service.dart';
import 'package:oneonones/common/utils/navigator.util.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    AuthenticationService.startup()
        .then((value) => value ? NavigatorUtil.navigate(context, '/') : NavigatorUtil.navigate(context, '/login'))
        .catchError((err) => NavigatorUtil.navigate(context, '/login'));
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
