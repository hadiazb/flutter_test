import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/user/domain/models/models.dart';
import 'package:app_llevaloo/user/config/case_use.dart';

class UsersProvider with ChangeNotifier {
  final UserUseCase _userUseCase = UserUseCase();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<User> users = [];
  User user = User();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void getUsers() async {
    users = await _userUseCase.crudUserUseCase.getAll();
    notifyListeners();
  }

  void getById(String id) async {
    user = await _userUseCase.crudUserUseCase.getById(id);
    notifyListeners();
  }

  void createUser(User body) async {
    await _userUseCase.crudUserUseCase.createUser(body);
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
