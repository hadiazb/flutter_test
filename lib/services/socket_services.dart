import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  final IO.Socket _socket = IO.io('http://192.168.1.35:3000', {
    "transports": ["websocket"],
    "autoConnect": true,
  });

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  bool notification = false;

  SocketService() {
    _initConfig();
  }

  void createNotification() {
    notification = true;
    notifyListeners();
  }

  void deleteNotification() {
    notification = false;
    notifyListeners();
  }

  void _initConfig() {
    _socket.onConnect((_) {
      log('connect');
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      log('disconnect');
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    _socket.on('crear-user', (payload) {
      log('nuevo-mensaje: $payload');
    });
  }
}
