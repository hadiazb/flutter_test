import 'package:app_llevaloo/user/domain/use_cases/marketsCategories/crud_markets_categories_use_case.dart';
import 'package:app_llevaloo/user/infraestructure/driven_adapter/marketsCategories_api/market_cateories_api.dart';

class MarketsCateogoriesUseCase {
  late MarketsCategoriesApi _marketCategoryApi;
  late CrudMarketsCategoriesUseCase crudMarketsCategoriesUseCase;

  MarketsCateogoriesUseCase() {
    _marketCategoryApi = MarketsCategoriesApi();
    crudMarketsCategoriesUseCase =
        CrudMarketsCategoriesUseCase(_marketCategoryApi);
  }
}
