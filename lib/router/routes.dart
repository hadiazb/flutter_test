import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/pages/list_user_page.dart';
import 'package:app_llevaloo/pages/create_user.dart';
import 'package:app_llevaloo/pages/user_page.dart';
import 'package:app_llevaloo/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
    UserPage.routeName: (BuildContext context) => const UserPage(),
    CreateUser.routeName: (BuildContext context) => const CreateUser(),
    ListUsers.routeName: (BuildContext context) => const ListUsers(),
  };
}
