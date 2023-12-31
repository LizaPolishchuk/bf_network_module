import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bf_network_module/src/common/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/domain/entities/user_entity.dart';

import '../../../bf_network_module.dart';
import 'api_client.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser(String userId);

  Future<UserEntity> updateUser(UserEntity user);

  Future<String> updateUserAvatar(File avatar);

  Future<void> switchThemeMode();

  Future<void> switchMasterMode(bool masterMode);

  Future<void> setCurrentLanguage(String locale);
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

  @override
  Future<void> setCurrentLanguage(String locale) async {
    _localStorage.setLanguage(locale);
  }

  @override
  Future<void> switchMasterMode(bool masterMode) async {
    _localStorage.setMasterMode(masterMode);
  }
}
