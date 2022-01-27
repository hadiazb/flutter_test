import 'package:app_llevaloo/user/domain/models/user/gateway/user_gateway.dart';
import 'package:app_llevaloo/user/domain/models/models.dart';

class CrudUserUseCase {
  final UserGateway _userGateway;

  CrudUserUseCase(this._userGateway);

  Future<List<User>> getAll() async {
    return await _userGateway.getAll();
  }

  Future<User> getById(String id) async {
    return await _userGateway.getById(id);
  }

  Future<User> createUser(User body) async {
    return await _userGateway.createUser(body);
  }
}
