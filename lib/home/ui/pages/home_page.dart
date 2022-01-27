import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_llevaloo/home/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';
import 'package:app_llevaloo/user/ui/pages/pages.dart';
import 'package:app_llevaloo/marketsCategory/ui/pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            appBarTheme(context, 'Home Principal', socketProvider.notification),
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
                'M Usuarios',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'CRUD Usuarios',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeUserPage.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.store,
                size: 30,
                color: Colors.indigo,
              ),
              title: const Text(
                'M Markets',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'CRUD MarketsCategory',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeMarketsCategoryPage.routeName);
              },
            ),
          ],
        ));
  }
}
