import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';

import '../../../salons_app_flutter_module.dart';
import 'api_client.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser(String userId);

  Future<UserEntity> updateUser(UserEntity user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final APIClient _apiClient;
  final LocalStorage _localStorage;

  UserRemoteDataSourceImpl(this._apiClient, this._localStorage);

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    final response = await _apiClient.updateUser(user);

    if (response.user == null) {
      throw(Failure(message: response.message ?? "updateUser error: user is null"));
    }

    _localStorage.setCurrentUserId(response.user!.id);
    _localStorage.setCurrentUser(response.user!);

    return response.user!;
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    final response = await _apiClient.getUser(userId);

    if (response.user == null) {
      throw(Failure(message: response.message ?? "getUser error: user is null"));
    }

    _localStorage.setCurrentUserId(response.user!.id);
    _localStorage.setCurrentUser(response.user!);

    return response.user!;
  }
}
