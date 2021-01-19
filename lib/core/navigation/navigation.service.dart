import 'package:flutter/cupertino.dart';

class Navigation {
  Navigation._();

  static navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (r) => false);
  }
}
