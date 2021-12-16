import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Ours
import 'package:app_llevaloo/domain/models/user/user_model.dart';
import 'package:app_llevaloo/config/case_use.dart';

class UsersProvider extends ChangeNotifier {
  final UserUseCase _userUseCase = UserUseCase();

  // variables para usar en las paginas
  List<User> users = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String nombre;
  late String apellido;
  late String edad;
  late bool sexo = true;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Sockets
  late IO.Socket socket;
  final String _baseUrl = '192.168.1.35:3000';

  UsersProvider() {
    getUsers();
    connect();
  }

  getUsers() async {
    users = await _userUseCase.getUserUseCase.getAll();
    notifyListeners();
  }

  Future<User> createUser() async {
    User body = User(
        nombre: nombre, apellido: apellido, edad: int.parse(edad), sexo: sexo);
    return await _userUseCase.createUserUseCase.createUser(body);
  }

  Future<User> getById(String id) async {
    return await _userUseCase.getUserUseCase.getById(id);
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void connect() {
    socket = IO.io("http://$_baseUrl", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();
  }
}
