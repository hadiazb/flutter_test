import 'package:app_llevaloo/domain/use_cases/user/create_user_use_case.dart';
import 'package:app_llevaloo/domain/use_cases/user/get_user_use_case.dart';
import 'package:app_llevaloo/infraestructure/driven_adapter/user_api/user_api.dart';

class UserUseCase {
  late UserApi _userApi;
  late GetUserUseCase getUserUseCase;

  late CreateUserUseCase createUserUseCase;

  UserUseCase() {
    _userApi = UserApi();
    getUserUseCase = GetUserUseCase(_userApi);
    createUserUseCase = CreateUserUseCase(_userApi);
  }
}
