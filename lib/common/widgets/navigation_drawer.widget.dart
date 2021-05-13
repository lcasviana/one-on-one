import 'package:flutter/material.dart';
import 'package:oneonones/common/models/user.model.dart';

class NavigationDrawer extends StatefulWidget {
  final UserModel _user;

  NavigationDrawer(this._user);

  @override
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget._user.name),
            accountEmail: Text(widget._user.email),
          ),
        ],
      ),
    );
  }
}
