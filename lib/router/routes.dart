import 'package:app_llevaloo/home/ui/pages/pages.dart';
import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/user/ui/pages/pages.dart';
import 'package:app_llevaloo/marketsCategory/ui/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),

    // User
    HomeUserPage.routeName: (BuildContext context) => const HomeUserPage(),
    UserPage.routeName: (BuildContext context) => const UserPage(),
    CreateUserPage.routeName: (BuildContext context) => const CreateUserPage(),
    ListUsersPage.routeName: (BuildContext context) => const ListUsersPage(),

    // MarketsCategory
    HomeMarketsCategoryPage.routeName: (BuildContext context) =>
        const HomeMarketsCategoryPage(),
    MarketsCategoriesPage.routeName: (BuildContext context) =>
        const MarketsCategoriesPage(),
    MarketCategoriePage.routeName: (BuildContext context) =>
        const MarketCategoriePage(),
    CreateMarketCategoriesPage.routeName: (BuildContext context) =>
        const CreateMarketCategoriesPage(),
  };
}
