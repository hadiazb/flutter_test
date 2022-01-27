import 'dart:convert';

class MarketCategory {
  MarketCategory({
    this.id,
    this.nombre,
    this.imagen,
    this.estatus,
    this.parent,
  });

  String? id;
  String? nombre;
  String? imagen;
  bool? estatus;
  Parent? parent;

  factory MarketCategory.fromJson(String str) =>
      MarketCategory.fromMap(json.decode(str));

  factory MarketCategory.fromMap(Map<String, dynamic> json) => MarketCategory(
        id: json["id"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        estatus: json["estatus"],
        parent: json["parent"] == null ? null : Parent.fromMap(json["parent"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "imagen": imagen,
        "estatus": estatus,
        "parent": parent == null ? null : parent!.toMap(),
      };
}

class Parent {
  Parent({
    required this.id,
    required this.nombre,
  });

  String id;
  String nombre;

  factory Parent.fromMap(Map<String, dynamic> json) => Parent(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
      };
}
