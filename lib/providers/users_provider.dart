import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Ours
import 'package:app_llevaloo/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final String _baseUrl = '10.0.2.2:3000';
  // final String _baseUrl = 'api.themoviedb.org';
  // final String _apiKey = 'ca911080e9c4d4c6fe846e025bea59db';
  List<User> users = [];

  UserProvider() {
    getUsers();
  }

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.https(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  // Future<String> _getJsonData(String endPoint, [int page = 1]) async {
  //   final url =
  //       Uri.https(_baseUrl, endPoint, {'api_key': _apiKey, 'page': '$page'});
  //   final response = await http.get(url);
  //   return response.body;
  // }

  getUsers() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    // final userResponse = User.fromJson(jsonData);

    // users = userResponse.results;
    print(jsonData);

    notifyListeners();
  }
}
