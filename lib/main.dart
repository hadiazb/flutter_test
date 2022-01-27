import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours

// Providers
import 'package:app_llevaloo/services/services.dart';

// UI
import 'package:app_llevaloo/home/ui/pages/pages.dart';

// Router
import 'package:app_llevaloo/router/routes.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => SocketService(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => MarketsCategoriesProvider(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: getApplicationRoutes(),
    );
  }
}
