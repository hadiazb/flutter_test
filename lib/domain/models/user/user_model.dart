import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

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
