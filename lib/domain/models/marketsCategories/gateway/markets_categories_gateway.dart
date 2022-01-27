import 'package:app_llevaloo/domain/models/models.dart';

abstract class MarketsCategoriesGateway {
  Future<List<MarketCategory>> getAll();
  Future<MarketCategory> getById(String id);
  Future<MarketCategory> createMarketCategory(MarketCategory body);
}
