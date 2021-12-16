import 'package:app_llevaloo/domain/models/user/gateway/user_gateway.dart';
import 'package:app_llevaloo/domain/models/user/user_model.dart';

class GetUserUseCase {
  final UserGateway _userGateway;

  GetUserUseCase(this._userGateway);

  Future<List<User>> getAll() async {
    return await _userGateway.getAll();
  }

  Future<User> getById(String id) async {
    return await _userGateway.getById(id);
  }
}
