import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/domain/models/user/user_model.dart';
import 'package:app_llevaloo/config/case_use.dart';

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
    users = await _userUseCase.getUserUseCase.getAll();
    notifyListeners();
  }

  void getById(String id) async {
    user = await _userUseCase.getUserUseCase.getById(id);
    notifyListeners();
  }

  void createUser(User body) async {
    await _userUseCase.createUserUseCase.createUser(body);
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
