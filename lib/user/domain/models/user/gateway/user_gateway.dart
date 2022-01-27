import 'package:app_llevaloo/user/domain/models/models.dart';

abstract class UserGateway {
  Future<List<User>> getAll();
  Future<User> getById(String id);
  Future<User> createUser(User body);
}
