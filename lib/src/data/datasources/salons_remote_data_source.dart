
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
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

  Future<List<Service>> getServicesList(String salonId);

  Future<void> updateService(String salonId, Service service);

  Future<void> removeService(String salonId, Service service);
}

class SalonsRemoteDataSourceImpl implements SalonsRemoteDataSource {
  late CollectionReference salonsCollection;
  late CollectionReference mastersCollection;
  LocalStorage localStorage;

  SalonsRemoteDataSourceImpl(this.localStorage) {
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
            arrayContains: (snapshot.docs.first.data() as Map<String, dynamic>) ["id"]);
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

        await saveSalonToLocalStorage(salonEntity, services);

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
    final Map<String, dynamic> data = salon.toJson();

    salonsCollection.doc(salon.id).set(data).catchError((Object error) {
      throw(error);
    });

    await saveSalonToLocalStorage(salon, null);

    return salon;
  }

  @override
  Future<void> updateService(String salonId, Service service) async {
    final salonDocument = await salonsCollection.doc(salonId).get();

    salonDocument.reference
        .collection("services")
        .doc(service.id)
        .set(service.toJson())
        .catchError((Object error) {
      print(error);
    });

    return;
  }

  @override
  Future<void> removeService(String salonId, Service service) async {
    final salonDocument = await salonsCollection.doc(salonId).get();

    salonDocument.reference
        .collection("services")
        .doc(service.id)
        .delete()
        .catchError((Object error) {
      print(error);
    });

    return;
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

    List<Master> mastersList =
        snapshot.docs.map((doc) => Master.fromJson(doc.data() as Map<String, dynamic>)).toList();
    print('mastersList: ${mastersList.length}');

    List<Service> services = servicesCollection.docs
        .map((doc) => Service.fromJson(doc.data()))
        .toList();
    print('services: ${services.length}');

    Salon salonEntity = Salon.fromJson(snap.data() as Map<String, dynamic>);

    await saveSalonToLocalStorage(salonEntity, services);

    return salonEntity;
  }

  @override
  Future<List<Service>> getServicesList(String salonId) async {
    final salonDocument = await salonsCollection.doc(salonId).get();

    QuerySnapshot snapshot =
        await salonDocument.reference.collection("services").get();

    List<Service> services = snapshot.docs.map((doc) {
      return Service.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();

    await localStorage.setServicesList(services);

    return services;
  }

  Future<void> saveSalonToLocalStorage(Salon salon, List<Service>? services) async {
    localStorage.setSalon(salon);
    localStorage.setSalonId(salon.id);
    if (services != null) {
      localStorage.setServicesList(services);
    }
  }
}
