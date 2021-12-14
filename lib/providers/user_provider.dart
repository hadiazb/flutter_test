import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Ours
import 'package:app_llevaloo/domain/models/user/user_model.dart';
import 'package:app_llevaloo/config/case_use.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  final String _baseUrl = '192.168.1.35:3000';
  late IO.Socket socket;
  final UserUseCase _userUseCase = UserUseCase();

  UsersProvider() {
    getUsers();
    connect();
    print('provider');
  }

  getUsers() async {
    users = await _userUseCase.getUserUseCase.getAll();

    notifyListeners();
  }

  void connect() {
    print('Connected');
    socket = IO.io("http://$_baseUrl", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();
  }
}
