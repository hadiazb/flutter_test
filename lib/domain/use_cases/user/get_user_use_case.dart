import 'package:app_llevaloo/domain/models/user/gateway/user_gateway.dart';
import 'package:app_llevaloo/domain/models/user/user_model.dart';

class GetUserUseCase {
  final UserGateway _userGateway;

  GetUserUseCase(this._userGateway);

  Future<List<User>> getAll() async {
    print('Dominio');
    return await _userGateway.getAll();
  }
}
