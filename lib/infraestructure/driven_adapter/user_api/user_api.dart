import 'package:http/http.dart' as http;

// Ours
import 'package:app_llevaloo/domain/models/user/user_model.dart';
import 'package:app_llevaloo/domain/models/user/gateway/user_gateway.dart';

class UserApi extends UserGateway {
  final String _baseUrl = '192.168.1.35:3000';
  List<User> users = [];

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  @override
  Future<List<User>> getAll() async {
    print('Infra');
    final jsonData = await _getJsonData('/api/user');
    final usersResponse = usersResponseFromMap(jsonData);
    return usersResponse.users;
  }
}
