import 'package:flutter/cupertino.dart';

abstract class NavigationService {
  static navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (r) => false);
  }
}
