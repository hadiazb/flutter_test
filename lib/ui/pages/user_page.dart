import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/domain/models/models.dart';
import 'package:app_llevaloo/ui/widgets/widgets.dart';
import 'package:app_llevaloo/services/services.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  static String routeName = 'user';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final User user = ModalRoute.of(context)!.settings.arguments as User;
      final userProvider = Provider.of<UsersProvider>(context, listen: false);
      userProvider.getById(user.Id.toString());
    });

    final socketProvider = Provider.of<SocketService>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
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
  build(BuildContext context) {
    final User userData = ModalRoute.of(context)!.settings.arguments as User;
    final socketProvider = Provider.of<SocketService>(context, listen: true);
    final userProvider = Provider.of<UsersProvider>(context);
    final user = userProvider.user;

    return Scaffold(
        appBar: appBarTheme(
            context, userData.Name.toString(), socketProvider.notification),
        body: user.Id != null
            ? Container(
                margin: const EdgeInsets.all(20),
                child: Table(
                  children: [
                    TableRow(
                        children: [const Text('Id'), Text(user.Id.toString())]),
                    TableRow(children: [
                      const Text('Nombre'),
                      Text(user.Name.toString())
                    ]),
                    TableRow(children: [
                      const Text('Apellido'),
                      Text(user.LastName.toString())
                    ]),
                    TableRow(children: [
                      const Text('Telefono'),
                      Text(user.Phone.toString())
                    ]),
                  ],
                ),
              )
            : const Text('Cargando...'));
  }
}
