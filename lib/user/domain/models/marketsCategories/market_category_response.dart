import 'dart:convert';

// Ours
import 'package:app_llevaloo/user/domain/models/models.dart';

MarketCatgoryResponse marketCategoryResponseFromMap(String str) =>
    MarketCatgoryResponse.fromMap(json.decode(str));

class MarketCatgoryResponse {
  MarketCatgoryResponse({
    required this.status,
    required this.marketCategories,
    this.error,
  });
  int status;
  MarketCategory marketCategories;
  dynamic error;

  factory MarketCatgoryResponse.fromMap(Map<String, dynamic> json) =>
      MarketCatgoryResponse(
          status: json["status"],
          marketCategories: MarketCategory.fromMap(json["marketCategories"]),
          error: json['error']);

  Map<String, dynamic> toMap() => {
        "status": status,
        "marketCategory": marketCategories.toMap(),
      };
}
