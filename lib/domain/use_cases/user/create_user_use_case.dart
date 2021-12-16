import 'package:app_llevaloo/domain/models/user/gateway/user_gateway.dart';
import 'package:app_llevaloo/domain/models/user/user_model.dart';

class CreateUserUseCase {
  final UserGateway _userGateway;

  CreateUserUseCase(this._userGateway);

  Future<User> createUser(User body) async {
    return await _userGateway.createUser(body);
  }
}
