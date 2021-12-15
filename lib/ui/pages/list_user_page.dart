import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
// Models
import 'package:app_llevaloo/domain/models/user/user_model.dart';

// UI
import 'package:app_llevaloo/ui/widgets/widgets.dart';

// State
import 'package:app_llevaloo/providers/users_provider.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key? key}) : super(key: key);
  static const String routeName = 'list_user';

  @override
  State<ListUsersPage> createState() => _ListUsersPage();
}

class _ListUsersPage extends State<ListUsersPage> {
  @override
  Widget build(BuildContext context) {
    late List<User> users = [];
    int count = 0;

    final userProvider = Provider.of<UsersProvider>(context);
    users = userProvider.users;

    void setStateIfMounted(f) {
      if (mounted) setState(f);
    }

    userProvider.socket.on('create-user', (user) {
      if (count == 0) {
        User newUser = User.fromMap(user);
        count = count + 1;
        setStateIfMounted(() {
          users.add(newUser);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Usuarios',
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
          itemCount: users.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, int i) {
            return CardUserWidget(users: userProvider, user: users[i]);
          }),
    );
  }
}
