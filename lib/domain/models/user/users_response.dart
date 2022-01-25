import 'dart:convert';

// Ours
import 'package:app_llevaloo/domain/models/models.dart';

UsersResponse usersResponseFromMap(String str) =>
    UsersResponse.fromMap(json.decode(str));

class UsersResponse {
  UsersResponse({
    required this.status,
    required this.users,
    this.error,
  });

  int status;
  List<User> users;
  dynamic error;

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
      status: json["status"],
      users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      error: json['error']);

  Map<String, dynamic> toMap() => {
        "status": status,
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}
