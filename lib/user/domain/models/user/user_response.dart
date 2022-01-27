import 'dart:convert';

// Ours
import 'package:app_llevaloo/user/domain/models/models.dart';

UserResponse userResponseFromMap(String str) =>
    UserResponse.fromMap(json.decode(str));

class UserResponse {
  UserResponse({
    required this.status,
    required this.user,
    this.error,
  });

  int status;
  User user;
  dynamic error;

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
      status: json["status"],
      user: User.fromMap(json["user"]),
      error: json['error']);

  Map<String, dynamic> toMap() => {
        "status": status,
        "user": user.toMap(),
      };
}
