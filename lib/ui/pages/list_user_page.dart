import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
// Models
import 'package:app_llevaloo/domain/models/user/user_model.dart';

// UI
import 'package:app_llevaloo/ui/widgets/widgets.dart';

// State
import 'package:app_llevaloo/providers/user_provider.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);
  static const String routeName = 'update_user';

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    print('UI List page');
    late List<User> users = [];
    int count = 0;

    final usersList = Provider.of<UsersProvider>(context);
    users = usersList.users;

    void setStateIfMounted(f) {
      if (mounted) setState(f);
    }

    usersList.socket.on('create-user', (user) {
      if (count == 0) {
        User newUser = User.fromMap(user);
        count = count + 1;
        // setState(() {
        //   users.add(newUser);
        // });

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
            return CardUserWidget(users: usersList, user: users[i]);
          }),
    );
  }
}
