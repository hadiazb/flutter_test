import 'package:flutter/material.dart';

// Ours
import 'package:app_llevaloo/user/domain/models/models.dart';
import 'package:app_llevaloo/user/config/case_use.dart';

class MarketsCategoriesProvider with ChangeNotifier {
  final MarketsCateogoriesUseCase _marketsCategoriesUseCase =
      MarketsCateogoriesUseCase();

  List<MarketCategory> marketsCategories = [];
  MarketCategory marketCategory = MarketCategory();

  void getMarketsCategories() async {
    marketsCategories =
        await _marketsCategoriesUseCase.crudMarketsCategoriesUseCase.getAll();
    notifyListeners();
  }

  void getMarketCategoryById(String id) async {
    marketCategory = await _marketsCategoriesUseCase
        .crudMarketsCategoriesUseCase
        .getById(id);
    notifyListeners();
  }

  void createMarketCategory(MarketCategory body) async {
    await _marketsCategoriesUseCase.crudMarketsCategoriesUseCase
        .createMarketCategory(body);
    notifyListeners();
  }
}
