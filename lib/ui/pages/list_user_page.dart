import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
// Models
import 'package:app_llevaloo/domain/models/models.dart';

// UI
import 'package:app_llevaloo/ui/widgets/widgets.dart';

// State
import 'package:app_llevaloo/services/users_services.dart';
import 'package:app_llevaloo/services/services.dart';

class ListUsersPage extends StatefulWidget {
  static String routeName = 'list_user';
  const ListUsersPage({Key? key}) : super(key: key);

  @override
  State<ListUsersPage> createState() => _ListUsersPage();
}

class _ListUsersPage extends State<ListUsersPage> {
  bool notification = false;
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    userProvider.getUsers();

    final socketProvider = Provider.of<SocketProvider>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
      UserResponse prueba = UserResponse.fromMap(payload);
      userProvider.users.add(prueba.user);
      notification = true;
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
    final userProvider = Provider.of<UsersProvider>(context, listen: true);

    return Scaffold(
      appBar: appBarTheme(context, 'Usuarios', notification),
      body: userProvider.users.isNotEmpty
          ? ListView.builder(
              itemCount: userProvider.users.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, int i) {
                return CardUserWidget(
                    users: userProvider, user: userProvider.users[i]);
              })
          : const Text('loading...'),
    );
  }
}
