import 'package:http/http.dart' as http;

// Ours
import 'package:app_llevaloo/domain/models/models.dart';
import 'package:app_llevaloo/domain/models/marketsCategories/gateway/markets_categories_gateway.dart';

class MarketsCategoriesApi extends MarketsCategoriesGateway {
  final String _baseUrl = '192.168.1.35:3000';

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.get(url);
    return response.body;
  }

  Future<String> _postJsonData(String endPoint, MarketCategory body) async {
    final url = Uri.http(_baseUrl, endPoint);
    final response = await http.post(url, body: body.toMap());
    return response.body;
  }

  @override
  Future<List<MarketCategory>> getAll() async {
    final jsonData = await _getJsonData('/api/marketCategory');
    final marketsCategoriesResponse =
        marketsCategoriesResponseFromMap(jsonData);
    return marketsCategoriesResponse.marketCategories;
  }

  @override
  Future<MarketCategory> getById(String id) async {
    final jsonData = await _getJsonData('/api/marketCategory/$id');
    final marketsCategoriesResponse = marketCategoryResponseFromMap(jsonData);
    return marketsCategoriesResponse.marketCategories;
  }

  @override
  Future<MarketCategory> createMarketCategory(MarketCategory body) async {
    final jsonData = await _postJsonData('/api/marketCategory/', body);
    final marketCategory = MarketCategory.fromJson(jsonData);
    return marketCategory;
  }
}
