import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Ours
import 'package:app_llevaloo/providers/users_provider.dart';
import 'package:app_llevaloo/pages/home_page.dart';
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
          create: (_) => UserProvider(),
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
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    // connect();
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

  // void connect() {
  //   socket = IO.io("http://10.0.2.2:3000", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  // socket.emit('alert', "Hola angular");
  // socket.on('list', (data) => {print(data)});
  // }
}
