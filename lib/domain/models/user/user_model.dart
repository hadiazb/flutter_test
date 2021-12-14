import 'dart:convert';

UsersResponse usersResponseFromMap(String str) =>
    UsersResponse.fromMap(json.decode(str));

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

class UsersResponse {
  UsersResponse({
    required this.status,
    required this.users,
    this.error,
  });

  int status;
  List<User> users;
  dynamic? error;

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
      status: json["status"],
      users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      error: json['error']);

  Map<String, dynamic> toMap() => {
        "status": status,
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}

class User {
  User({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.sexo,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String nombre;
  String apellido;
  int edad;
  bool sexo;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        edad: json["edad"],
        sexo: json["sexo"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "edad": edad,
        "sexo": sexo,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
