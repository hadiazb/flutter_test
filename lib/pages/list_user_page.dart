import 'package:flutter/material.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({Key? key}) : super(key: key);
  static const String routeName = 'update_user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text('Usuario 1')),
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text('Usuario 2')),
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text('Usuario 3')),
        ],
      ),
    );
  }
}
