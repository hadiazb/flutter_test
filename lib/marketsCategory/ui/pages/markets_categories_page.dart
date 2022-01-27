import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_llevaloo/services/services.dart';
import 'package:app_llevaloo/marketsCategory/ui/pages/pages.dart';
import 'package:app_llevaloo/user/ui/widgets/widgets.dart';

class MarketsCategoriesPage extends StatefulWidget {
  const MarketsCategoriesPage({Key? key}) : super(key: key);
  static String routeName = 'markets';

  @override
  State<MarketsCategoriesPage> createState() => _MarketsCategoriesPageState();
}

class _MarketsCategoriesPageState extends State<MarketsCategoriesPage> {
  @override
  void initState() {
    super.initState();
    final marketsCategoriesProvider =
        Provider.of<MarketsCategoriesProvider>(context, listen: false);
    marketsCategoriesProvider.getMarketsCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final marketsCategoriesProvider =
        Provider.of<MarketsCategoriesProvider>(context, listen: true);

    return Scaffold(
        appBar: appBarTheme(context, 'Markets', false),
        body: ListView.builder(
            itemCount: marketsCategoriesProvider.marketsCategories.length,
            itemBuilder: (_, int i) {
              return Center(
                child: Card(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ListTile(
                      leading: const Icon(Icons.stop_circle),
                      title: Text(marketsCategoriesProvider
                          .marketsCategories[i].nombre
                          .toString()),
                      subtitle: Text(marketsCategoriesProvider
                          .marketsCategories[i].id
                          .toString()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('VER MARKETCATEGORY'),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MarketCategoriePage.routeName,
                                arguments: marketsCategoriesProvider
                                    .marketsCategories[i]);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ]),
                ),
              );
            }));
  }
}
