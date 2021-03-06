import 'package:http/http.dart' as http;

// Ours
import 'package:app_llevaloo/user/domain/models/models.dart';
import 'package:app_llevaloo/user/domain/models/user/gateway/user_gateway.dart';

class UserApi extends UserGateway {
  final String _baseUrl = '192.168.1.35:3000';

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  Future<String> _postJsonData(String endPoint, User body) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.post(url, body: body.toMap());
    return response.body;
  }

  @override
  Future<List<User>> getAll() async {
    final jsonData = await _getJsonData('/api/user');
    final usersResponse = usersResponseFromMap(jsonData);
    return usersResponse.users;
  }

  @override
  Future<User> getById(String id) async {
    final jsonData = await _getJsonData('/api/user/$id');
    final userResponse = userResponseFromMap(jsonData);
    return userResponse.user;
  }

  @override
  Future<User> createUser(User body) async {
    final jsonData = await _postJsonData('/api/user/', body);
    final user = User.fromJson(jsonData);
    return user;
  }
}
