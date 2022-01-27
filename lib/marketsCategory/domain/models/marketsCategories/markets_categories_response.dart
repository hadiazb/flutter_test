// To parse this JSON data, do
//
//     final marketsCategoriesResponse = marketsCategoriesResponseFromMap(jsonString);

import 'dart:convert';

import 'markets_categories_model.dart';

MarketsCategoriesResponse marketsCategoriesResponseFromMap(String str) =>
    MarketsCategoriesResponse.fromMap(json.decode(str));

String marketsCategoriesResponseToMap(MarketsCategoriesResponse data) =>
    json.encode(data.toMap());

class MarketsCategoriesResponse {
  MarketsCategoriesResponse(
      {required this.status, required this.marketCategories, this.error});

  int status;
  List<MarketCategory> marketCategories;
  dynamic error;

  factory MarketsCategoriesResponse.fromMap(Map<String, dynamic> json) =>
      MarketsCategoriesResponse(
          status: json["status"],
          marketCategories: List<MarketCategory>.from(
              json["marketCategories"].map((x) => MarketCategory.fromMap(x))),
          error: json['error']);

  Map<String, dynamic> toMap() => {
        "status": status,
        "marketCategories":
            List<dynamic>.from(marketCategories.map((x) => x.toMap())),
      };
}
