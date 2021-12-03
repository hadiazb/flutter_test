import 'package:app_llevaloo/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/widgets/card_user_widget.dart';
import 'package:app_llevaloo/providers/users_provider.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);
  static const String routeName = 'update_user';

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    late List<User> users = [];
    int count = 0;
    final userList = Provider.of<UserProvider>(context);
    users = userList.users;

    userList.socket.on('create-user', (user) {
      if (count == 0) {
        User newUser = User(
            createdAt: user["createAt"],
            updatedAt: user["updateAt"],
            id: user["id"],
            apellido: user["apellido"],
            sexo: user["sexo"],
            edad: user["edad"],
            nombre: user["nombre"]);
        count = count + 1;
        setState(() {
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
            return CardUser(users: userList, user: users[i]);
          }),
    );
  }
}
