import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

const SALONS_COLLECTION = 'salons';
const SERVICES_COLLECTION = 'services';
const MASTERS_COLLECTION = 'masters';
const AVAILABLE_TIMES_COLLECTION = 'available_times';

abstract class SalonsRemoteDataSource {
  Future<List<Salon>> getSalonsList(String userId);

  Future<Salon> getSalonById(String salonId);

  Future<Salon> updateSalon(Salon salonEntity);
}

class SalonsRemoteDataSourceImpl implements SalonsRemoteDataSource {
  late CollectionReference salonsCollection;
  late CollectionReference mastersCollection;
  LocalStorage _localStorage;
  APIClient _apiClient;

  SalonsRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    salonsCollection = FirebaseFirestore.instance.collection(SALONS_COLLECTION);
    mastersCollection =
        FirebaseFirestore.instance.collection(MASTERS_COLLECTION);
  }

  @override
  Future<List<Salon>> getSalonsList(String userId) async {
    QuerySnapshot snapshot;

    ///if it is not admin
    if (userId.isNotEmpty) {
      Query query = salonsCollection.where("ownerId", isEqualTo: userId);
      QuerySnapshot snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        QueryDocumentSnapshot snap = (await query.get()).docs.first;

        Query queryMasters = mastersCollection.where("salonIdList",
            arrayContains:
                (snapshot.docs.first.data() as Map<String, dynamic>)["id"]);
        List<Master> mastersList = (await queryMasters.get())
            .docs
            .map((doc) => Master.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
        print('mastersList: ${mastersList.length}');

        final servicesCollection =
            await snap.reference.collection(SERVICES_COLLECTION).get();
        List<Service> services = servicesCollection.docs
            .map((doc) => Service.fromJson(doc.data()))
            .toList();
        print('services: ${services.length}');

        Salon salonEntity = Salon.fromJson(snap.data() as Map<String, dynamic>);

        // await _saveSalonToLocalStorage(salonEntity, services);

        return [salonEntity];
      }
    } else {
      snapshot = await salonsCollection.get();
      return snapshot.docs
          .map((doc) => Salon.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }
  }

  @override
  Future<Salon> updateSalon(Salon salon) async {
    final response = await _apiClient.updateSalon(salon);

    if (response.salon == null) {
      throw (Failure(
          message: response.message ?? "updateUser error: user is null"));
    }

    _saveSalonToLocalStorage(response);

    return response.salon!;
  }

  @override
  Future<Salon> getSalonById(String salonId) async {
    print('getSalonById: $salonId');
    DocumentSnapshot snap = await salonsCollection.doc(salonId).get();
    final servicesCollection =
        await snap.reference.collection(SERVICES_COLLECTION).get();
    Query query =
        mastersCollection.where("salonIdList", arrayContains: salonId);
    QuerySnapshot snapshot = await query.get();

    List<Master> mastersList = snapshot.docs
        .map((doc) => Master.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    print('mastersList: ${mastersList.length}');

    List<Service> services = servicesCollection.docs
        .map((doc) => Service.fromJson(doc.data()))
        .toList();
    print('services: ${services.length}');

    Salon salonEntity = Salon.fromJson(snap.data() as Map<String, dynamic>);

    // await _saveSalonToLocalStorage(salonEntity, services);

    return salonEntity;
  }

  Future<void> _saveSalonToLocalStorage(SalonResponse response) async {
    _localStorage.setSalon(response.salon!);
    _localStorage.setSalonId(response.salon!.id);
    _localStorage.setMastersList(response.masters ?? []);
    _localStorage.setServicesList(response.services ?? []);
  }
}
