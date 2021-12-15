import 'package:app_llevaloo/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/providers/providers.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  static const String routeName = 'user';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    final userProvider = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.nombre,
          style: const TextStyle(fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: FutureBuilder(
        future: userProvider.getById(user.id.toString()),
        builder: (_, AsyncSnapshot<User> user) {
          if (user.data == null) {
            return const Text('Cargando');
          } else {
            return Container(
              margin: const EdgeInsets.all(20),
              child: Table(
                children: [
                  TableRow(children: [
                    const Text('Id'),
                    Text(user.data!.id.toString())
                  ]),
                  TableRow(children: [
                    const Text('Nombre'),
                    Text(user.data!.nombre)
                  ]),
                  TableRow(children: [
                    const Text('Apellido'),
                    Text(user.data!.apellido)
                  ]),
                  TableRow(children: [
                    const Text('Edad'),
                    Text(user.data!.edad.toString())
                  ]),
                  TableRow(children: [
                    const Text('Sexo'),
                    Text(user.data!.sexo ? 'Hombre' : 'Mujer')
                  ]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
