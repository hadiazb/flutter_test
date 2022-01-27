import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/user/ui/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    UserPage.routeName: (BuildContext context) => const UserPage(),
    CreateUserPage.routeName: (BuildContext context) => const CreateUserPage(),
    ListUsersPage.routeName: (BuildContext context) => const ListUsersPage(),
    MarketsCategoriesPage.routeName: (BuildContext context) =>
        const MarketsCategoriesPage(),
    MarketCategoriePage.routeName: (BuildContext context) =>
        const MarketCategoriePage(),
    CreateMarketCategoriesPage.routeName: (BuildContext context) =>
        const CreateMarketCategoriesPage(),
  };
}
