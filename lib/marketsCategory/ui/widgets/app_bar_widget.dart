import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/user/ui/pages/pages.dart';
import 'package:app_llevaloo/services/services.dart';

AppBar appBarTheme(BuildContext context, String title, bool notification) {
  final socketProvider = Provider.of<SocketService>(context, listen: true);
  final route = ModalRoute.of(context)!.settings.name;

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
            ? IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  socketProvider.deleteNotification();
                  if (route != UserPage.routeName) {
                    Navigator.pushNamed(context, ListUsersPage.routeName);
                  }
                },
                icon: Icon(
                  Icons.notification_important,
                  color: Colors.red[300],
                ),
              )
            : IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  socketProvider.deleteNotification();
                },
                icon: Icon(
                  Icons.notification_important_outlined,
                  color: Colors.blue[300],
                ),
              ),
      )
    ],
  );
}
