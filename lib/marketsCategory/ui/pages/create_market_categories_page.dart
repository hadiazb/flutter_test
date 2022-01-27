import 'package:flutter/material.dart';

import 'package:app_llevaloo/marketsCategory/ui/widgets/widgets.dart';

class CreateMarketCategoriesPage extends StatelessWidget {
  const CreateMarketCategoriesPage({Key? key}) : super(key: key);
  static const routeName = 'create-market';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme(context, 'Crear un Market', false),
      body: Center(
        child: Text('Crear un Market'),
      ),
    );
  }
}
