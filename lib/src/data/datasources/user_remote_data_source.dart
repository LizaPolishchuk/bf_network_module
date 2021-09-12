import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';

import '../../../salons_app_flutter_module.dart';
import 'api_client.dart';

const USERS_COLLECTION = 'users';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser1(String userId);

  Future<UserEntity> getUser(String userId);

  Future<dynamic> createUser(UserEntity user);

  Future<UserEntity> updateUser(UserEntity user);

  Future<bool> checkIsUserPresent(String userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  late CollectionReference personsCollection;
  final APIClient _apiClient;
  final LocalStorage _localStorage;

  UserRemoteDataSourceImpl(this._apiClient, this._localStorage) {
    this.personsCollection =
        FirebaseFirestore.instance.collection(USERS_COLLECTION);
  }

  @override
  Future<bool> checkIsUserPresent(String id) async {
    final snap = await personsCollection.doc(id).get();
    print('checked isPersonPresent ${snap.exists}');

    if (snap == null || !snap.exists) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<dynamic> createUser(UserEntity user) async {
    final Map<String, dynamic> data = user.toJson();

    personsCollection.doc(user.id).set(data).catchError((Object error) {
      print(error);
      return false;
    });

    return true;
  }

  @override
  Future<UserEntity> getUser1(String userId) async {
    final snap = await personsCollection.doc(userId).get();

    UserEntity user = UserEntity.fromJson(snap.data() as Map<String, dynamic>);

    return user;
  }

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
