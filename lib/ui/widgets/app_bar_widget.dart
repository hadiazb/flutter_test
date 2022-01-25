import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/providers/providers.dart';

AppBar appBarTheme(BuildContext context, String title, bool notification) {
  final socketProvider = Provider.of<SocketProvider>(context, listen: true);
  // final route = ModalRoute.of(context)!.settings.name;

  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.indigo,
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 10),
        child: (socketProvider.serverStatus == ServerStatus.online)
            ? Icon(
                Icons.check_circle,
                color: Colors.blue[300],
              )
            : Icon(
                Icons.offline_bolt,
                color: Colors.red[300],
              ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 10),
        child: notification
            ? Icon(
                Icons.notification_important,
                color: Colors.red[300],
              )
            : Icon(
                Icons.notification_important_outlined,
                color: Colors.blue[300],
              ),
      )
    ],
  );
}