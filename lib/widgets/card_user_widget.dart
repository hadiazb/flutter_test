// ignore_for_file: file_names

import 'package:app_llevaloo/models/user_model.dart';
import 'package:app_llevaloo/pages/user_page.dart';
import 'package:app_llevaloo/providers/users_provider.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final UserProvider users;
  final User user;

  const CardUser({Key? key, required this.users, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.indigo,
      child: Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: const Text(
                      'Nombre',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Text(
                      users.users.isEmpty ? 'Loading' : user.nombre,
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: const Text(
                      'Apellido',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Text(
                      users.users.isEmpty ? 'Loading' : user.apellido,
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: const Text(
                      'Edad',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Text(
                      users.users.isEmpty ? 'Loading' : user.edad.toString(),
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: const Text(
                      'Sexo',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Text(
                      users.users.isEmpty
                          ? 'Loading'
                          : user.sexo == true
                              ? 'Male'
                              : 'Female',
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UserPage.routeName);
                    },
                    child: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.indigo,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
