import 'package:app_llevaloo/user/domain/use_cases/user/crud_user_use_case.dart';
import 'package:app_llevaloo/user/infraestructure/driven_adapter/user_api/user_api.dart';

class UserUseCase {
  late UserApi _userApi;
  late CrudUserUseCase crudUserUseCase;

  UserUseCase() {
    _userApi = UserApi();
    crudUserUseCase = CrudUserUseCase(_userApi);
  }
}
