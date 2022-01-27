import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/user/domain/models/user/user_model.dart';
import 'package:app_llevaloo/services/services.dart';
import 'package:app_llevaloo/user/ui/pages/pages.dart';

class CardUserWidget extends StatelessWidget {
  final UsersProvider users;
  final User user;

  const CardUserWidget({Key? key, required this.users, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.indigo,
      elevation: 5,
      shadowColor: Colors.amber,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Table(
          children: [
            TableRow(children: [
              const Text(
                'Id',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(users.users.isEmpty ? 'loading...' : user.Id.toString(),
                  style: const TextStyle(color: Colors.white))
            ]),
            TableRow(children: [
              const Text(
                'Nombre',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(users.users.isEmpty ? 'loading...' : user.Name.toString(),
                  style: const TextStyle(color: Colors.white))
            ]),
            TableRow(children: [
              const Text(
                'Apellido',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(
                  users.users.isEmpty ? 'loading...' : user.LastName.toString(),
                  style: const TextStyle(color: Colors.white))
            ]),
            TableRow(children: [
              const Text(
                'Telefono',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(users.users.isEmpty ? 'loading...' : user.Phone.toString(),
                  style: const TextStyle(color: Colors.white))
            ]),
            TableRow(children: [
              Container(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, UserPage.routeName,
                      arguments: user);
                },
                child: const Text('Ver más'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
