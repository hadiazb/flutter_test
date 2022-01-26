import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/ui/pages/pages.dart';
import 'package:app_llevaloo/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool notification = false;

  @override
  void initState() {
    super.initState();

    final socketProvider = Provider.of<SocketProvider>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
      notification = true;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme(context, 'Home', notification),
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
                Navigator.pushNamed(
                  context,
                  ListUsersPage.routeName,
                );
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
                Navigator.pushNamed(context, CreateUserPage.routeName);
              },
            ),
          ],
        ));
  }
}
