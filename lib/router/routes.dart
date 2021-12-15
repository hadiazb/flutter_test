import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/ui/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    UserPage.routeName: (BuildContext context) => const UserPage(),
    CreateUserPage.routeName: (BuildContext context) => const CreateUserPage(),
    ListUsersPage.routeName: (BuildContext context) => const ListUsersPage(),
  };
}
