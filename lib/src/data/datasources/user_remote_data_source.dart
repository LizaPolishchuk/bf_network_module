import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';

const USERS_COLLECTION = 'users';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser(String userId);

  Future<dynamic> createUser(UserEntity user);

  Future<bool> checkIsUserPresent(String userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  late CollectionReference personsCollection;

  UserRemoteDataSourceImpl() {
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
    final Map<String, dynamic> data = user.toMap();

    personsCollection.doc(user.id).set(data).catchError((Object error) {
      print(error);
      return false;
    });

    return true;
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    final snap = await personsCollection.doc(userId).get();

    UserEntity user = UserEntity.fromMap(snap.data() ?? {});

    return user;
  }
}
