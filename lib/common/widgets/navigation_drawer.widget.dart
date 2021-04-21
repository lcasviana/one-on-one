import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/common/interfaces/services/authentication.service.i.dart';

class NavigationDrawer extends StatelessWidget {
  // TODO: Validade this implementation
  final IAuthenticationService _authenticationService = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text('Head')),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              _authenticationService.logout().then((_) => Modular.to.navigate('/login')).catchError(() {});
            },
          ),
        ],
      ),
    );
  }
}
