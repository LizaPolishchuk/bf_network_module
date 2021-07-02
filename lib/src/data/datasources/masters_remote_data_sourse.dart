import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/local_data_source.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';

import '../../injection_container.dart';

const MASTERS_COLLECTION = 'masters';

abstract class MastersRemoteDataSource {
  Future<List<Master>> getMastersList(String salonId);

  Future<void> updateMaster(Master master);

  Future<void> removeMaster(Master master);
}

class MastersRemoteDataSourceImpl implements MastersRemoteDataSource {
  late CollectionReference mastersCollection;
  late LocalDataSource localDataSource;
  LocalStorage localStorage;

  MastersRemoteDataSourceImpl(this.localStorage) {
    localDataSource = getIt<LocalDataSource>();
    mastersCollection =
        FirebaseFirestore.instance.collection(MASTERS_COLLECTION);
  }

  @override
  Future<List<Master>> getMastersList(String salonId) async {
    Query query = mastersCollection.where("workedInSalons", arrayContains: salonId);
    QuerySnapshot snapshot = await query.get();

    print('getMastersList: ${snapshot.docs.length}');

    List<Master> mastersList = snapshot.docs.map((doc) =>
        Master.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    localStorage.setMastersList(mastersList);

    return mastersList;
  }

  @override
  Future<void> updateMaster(Master master) async {
    final Map<String, dynamic> data = master.toJson();

    mastersCollection.doc(master.id).set(data).catchError((Object error) {
      print(error);
      return;
    });

    return;
  }

  @override
  Future<void> removeMaster(Master master) async {
    mastersCollection.doc(master.id).delete().catchError((Object error) {
      print(error);
    });

    return;
  }
}
