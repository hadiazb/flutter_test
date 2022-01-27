import 'package:app_llevaloo/user/domain/models/marketsCategories/gateway/markets_categories_gateway.dart';
import 'package:app_llevaloo/user/domain/models/models.dart';

class CrudMarketsCategoriesUseCase {
  final MarketsCategoriesGateway _marketsCategoriesGateway;

  CrudMarketsCategoriesUseCase(this._marketsCategoriesGateway);

  Future<List<MarketCategory>> getAll() async {
    return await _marketsCategoriesGateway.getAll();
  }

  Future<MarketCategory> getById(String id) async {
    return await _marketsCategoriesGateway.getById(id);
  }

  Future<MarketCategory> createMarketCategory(MarketCategory body) async {
    return await _marketsCategoriesGateway.createMarketCategory(body);
  }
}
