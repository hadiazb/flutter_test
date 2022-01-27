import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/marketsCategory/ui/pages/pages.dart';
import 'package:app_llevaloo/marketsCategory/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';

class HomeMarketsCategoryPage extends StatefulWidget {
  const HomeMarketsCategoryPage({Key? key}) : super(key: key);
  static String routeName = 'home_markets_category';

  @override
  State<HomeMarketsCategoryPage> createState() =>
      _HomeMarketsCategoryPageState();
}

class _HomeMarketsCategoryPageState extends State<HomeMarketsCategoryPage> {
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
        appBar: appBarTheme(
            context, 'Home MarketsCategory', socketProvider.notification),
        body: Column(
          children: [
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.store,
                size: 30,
                color: Colors.indigo,
              ),
              title: const Text(
                'Markets-Categories',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'Mira todos los Markets-Categories',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(context, MarketsCategoriesPage.routeName);
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
                'Crear Markets-Categories',
                style: TextStyle(color: Colors.indigo, fontSize: 21),
              ),
              subtitle: const Text(
                'Crea un Market-Categorie',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, CreateMarketCategoriesPage.routeName);
              },
            ),
          ],
        ));
  }
}
