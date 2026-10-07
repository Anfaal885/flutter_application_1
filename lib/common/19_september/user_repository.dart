import 'user.dart';
import 'user_api_service.dart';

class UserRepository {
  final UserApiService _apiService;

  UserRepository({
    UserApiService? apiService,
  }) : _apiService = apiService ?? UserApiService();

  Future<List<User>> getUsers() {
    return _apiService.fetchUsers();
  }
}