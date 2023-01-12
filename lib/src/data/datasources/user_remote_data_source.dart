import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:salons_app_flutter_module/src/common/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';

import '../../../salons_app_flutter_module.dart';
import 'api_client.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser(String userId);

  Future<UserEntity> updateUser(UserEntity user);

  Future<String> updateUserAvatar(File avatar);

  Future<void> switchThemeMode();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final APIClient _apiClient;
  final LocalStorage _localStorage;
  late FirebaseStorage _firebaseStorage;

  UserRemoteDataSourceImpl(this._apiClient, this._localStorage) {
    _firebaseStorage = FirebaseStorage.instance;
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateUser(user);

    if (response.user == null) {
      throw (Failure(message: response.message ?? "updateUser error: user is null"));
    }

    _localStorage.setCurrentUserId(response.user!.id);
    _localStorage.setCurrentUser(response.user!);

    return response.user!;
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUser(userId);

    if (response.user == null) {
      throw (Failure(message: response.message ?? "getUser error: user is null"));
    }

    _localStorage.setCurrentUserId(response.user!.id);
    _localStorage.setCurrentUser(response.user!);

    return response.user!;
  }

  @override
  Future<String> updateUserAvatar(File avatar) async {
    String? currentUserId = await _localStorage.getUserId();

    assert(currentUserId != null);

    UploadTask uploadTask = _firebaseStorage.ref().child('/user/$currentUserId/media/profile_pic.png').putFile(avatar);

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Future<void> switchThemeMode() async {
    _localStorage.switchThemeMode();
  }
}
