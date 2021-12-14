import 'package:app_llevaloo/domain/models/user/user_model.dart';

abstract class UserGateway {
  Future<List<User>> getAll();
}
