import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/pages/create_user.dart';
import 'package:app_llevaloo/pages/list_user_page.dart';
import 'package:app_llevaloo/pages/user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.people_alt,
                size: 30,
                color: Colors.indigo,
              ),
              title: const Text(
                'Usuarios',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'Lista todos los usuarios registrados',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, ListUsers.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.create_outlined,
                size: 30,
                color: Colors.indigo,
              ),
              title: const Text(
                'Crear Usuario',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'Crea usuario en la base de datos',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, CreateUser.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                size: 30,
                color: Colors.indigo,
              ),
              title: const Text(
                'Usuario XXX',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'Crea usuario en la base de datos',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, UserPage.routeName);
              },
            ),
          ],
        ));
  }
}
