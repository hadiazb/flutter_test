import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  static const String routeName = 'users';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('User'),
    );
  }
}
