import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Ours
import 'package:app_llevaloo/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final String _baseUrl = '192.168.1.35:3000';
  List<User> users = [];
  late IO.Socket socket;

  List<User> userFromMap(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

  UserProvider() {
    getUsers();
    connect();
  }

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  getUsers() async {
    final jsonData = await _getJsonData('/api/user');
    final usersResponse = userFromMap(jsonData);
    users = usersResponse;

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
