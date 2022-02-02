import 'package:app_llevaloo/infraestructure/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
// Models
import 'package:app_llevaloo/domain/models/models.dart';

// UI
import 'package:app_llevaloo/infraestructure/ui/widgets/widgets.dart';

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
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    userProvider.getUsers();

    final socketProvider = Provider.of<SocketService>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
      UserResponse prueba = UserResponse.fromMap(payload);
      userProvider.users.add(prueba.user);
      socketProvider.createNotification();
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
    final socketProvider = Provider.of<SocketService>(context, listen: true);

    return Scaffold(
      appBar: appBarTheme(context, 'Usuarios', socketProvider.notification),
      body: userProvider.users.isNotEmpty
          ? ListView.builder(
              itemCount: userProvider.users.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, int i) {
                return Center(
                  child: Card(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                            'Nombre:  ${userProvider.users[i].Name.toString()}'),
                        subtitle:
                            Text('Id:  ${userProvider.users[i].Id.toString()}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('VER USER'),
                            onPressed: () {
                              Navigator.pushNamed(context, UserPage.routeName,
                                  arguments: userProvider.users[i]);
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ]),
                  ),
                );
              })
          : const Text('loading...'),
    );
  }
}