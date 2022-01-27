import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/user/ui/pages/pages.dart';
import 'package:app_llevaloo/user/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({Key? key}) : super(key: key);
  static String routeName = 'home_user';

  @override
  State<HomeUserPage> createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  @override
  void initState() {
    super.initState();

    final socketProvider = Provider.of<SocketService>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
      socketProvider.createNotification();
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
    final socketProvider = Provider.of<SocketService>(context, listen: true);

    return Scaffold(
        appBar:
            appBarTheme(context, 'Home Usuarios', socketProvider.notification),
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
