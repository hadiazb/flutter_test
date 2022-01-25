import 'package:http/http.dart' as http;

// Ours
import 'package:app_llevaloo/domain/models/models.dart';
import 'package:app_llevaloo/domain/models/user/gateway/user_gateway.dart';

class UserApi extends UserGateway {
  final String _baseUrl = '192.168.1.35:3000';
  List<User> users = [];

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  Future<String> _postJsonData(String endPoint, User body) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.post(url, body: {
      "Name": body.Name,
      "LastName": body.LastName,
      "Phone": body.Phone,
      // "Id": body.Id,
      // "Email": body.Email,
      // "RegistrationDate": body.RegistrationDate,
      // "ProfilePhoto": body.ProfilePhoto,
      // "IsActive": body.IsActive,
      // "InvitationCode": body.InvitationCode,
      // "VirtualWallet": body.VirtualWallet,
      // "BirthDate": body.BirthDate,
      // "MarketId": body.MarketId,
      // "Admin": body.Admin,
      // "Address": body.Address,
      // "Gender": body.Gender,
      // "TypeUser": body.TypeUser,
      // "LicenseValidity": body.LicenseValidity,
      // "AccountNumber": body.AccountNumber,
      // "Coordinator": body.Coordinator,
      // "IdCity": body.IdCity,
      // "haveDatafono": body.haveDatafono,
      // "IdMarket": body.IdMarket,
      // "Verified": body.Verified,
      // "Id_Old": body.Id_Old,
      // "TokenPush": body.TokenPush,
      // "Longitude": body.Longitude,
      // "Latitude": body.Latitude,
      // "Instructions": body.Instructions,
      // "Password": body.Password,
      // "IsDeleted": body.IsDeleted,
    });
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
