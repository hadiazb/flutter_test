import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({Key? key}) : super(key: key);
  static const String routeName = 'create_user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Crear Usuarios'),
      centerTitle: true,
      backgroundColor: Colors.indigo,
    ));
  }
}
