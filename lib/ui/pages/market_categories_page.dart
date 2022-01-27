import 'package:flutter/material.dart';

import 'package:app_llevaloo/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';
import 'package:app_llevaloo/domain/models/models.dart';
import 'package:provider/provider.dart';

class MarketCategoriePage extends StatefulWidget {
  const MarketCategoriePage({Key? key}) : super(key: key);
  static const routeName = 'market';

  @override
  State<MarketCategoriePage> createState() => _MarketCategoriePageState();
}

class _MarketCategoriePageState extends State<MarketCategoriePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final marketCategorieProvider =
          Provider.of<MarketsCategoriesProvider>(context, listen: false);
      final MarketCategory marketCategoryData =
          ModalRoute.of(context)!.settings.arguments as MarketCategory;
      marketCategorieProvider
          .getMarketCategoryById(marketCategoryData.id.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MarketCategory marketCategoryData =
        ModalRoute.of(context)!.settings.arguments as MarketCategory;
    final marketCategorieProvider =
        Provider.of<MarketsCategoriesProvider>(context, listen: true);

    print(marketCategorieProvider.marketCategory);

    return Scaffold(
        appBar:
            appBarTheme(context, marketCategoryData.nombre.toString(), false),
        body: Center(
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                leading: const Icon(Icons.stop_circle),
                title:
                    Text(marketCategorieProvider.marketCategory.id.toString()),
                subtitle: Text(
                    marketCategorieProvider.marketCategory.nombre.toString()),
              ),
            ]),
          ),
        ));
  }
}
