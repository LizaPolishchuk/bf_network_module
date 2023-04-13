import 'package:bf_network_module/src/api/api_client_web.dart';
import 'package:bf_network_module/src/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/api/api_client_mobile.dart';
import 'package:bf_network_module/src/cache/local_storage.dart';
import 'package:bf_network_module/src/repositories/appointment_repository.dart';
import 'package:bf_network_module/src/repositories/feedback_repository.dart';
import 'package:bf_network_module/src/repositories/individual_appointment_repository.dart';
import 'package:bf_network_module/src/repositories/master_repository.dart';
import 'package:bf_network_module/src/repositories/media_repository.dart';
import 'package:bf_network_module/src/repositories/promo_repository.dart';
import 'package:bf_network_module/src/repositories/push_repository.dart';
import 'package:bf_network_module/src/repositories/salon_repository.dart';
import 'package:bf_network_module/src/repositories/service_repository.dart';
import 'package:bf_network_module/src/repositories/user_repository.dart';
import 'package:bf_network_module/src/utils/custom_interceptors.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;
final String webClientId = "883762712602-6i0k9dj1t1mulse24pmgdnkcalsqg2rb.apps.googleusercontent.com";

Future<void> init() async {
  ///Repositories
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerLazySingleton(() => AdminRepository(getIt(), getIt()));
  getIt.registerLazySingleton(() => UserRepository(getIt(), getIt()));
  getIt.registerLazySingleton(() => FeedbackRepository(getIt()));
  getIt.registerLazySingleton(() => ServiceRepository(getIt()));
  getIt.registerLazySingleton(() => SalonRepository(getIt()));
  getIt.registerLazySingleton(() => PushRepository(getIt()));
  getIt.registerLazySingleton(() => PromoRepository(getIt()));
  getIt.registerLazySingleton(() => MediaRepository(getIt()));
  getIt.registerLazySingleton(() => MasterRepository(getIt()));
  getIt.registerLazySingleton(() => IndividualAppointmentRepository(getIt()));
  getIt.registerLazySingleton(() => AppointmentRepository(getIt()));
  getIt.registerLazySingleton(() => GooglePlacesRepository(Uuid().v4()));

  ///External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => LocalStorage());

  getIt.registerLazySingleton(() => GoogleSignIn(clientId: webClientId));
  // getIt.registerLazySingleton(() => FacebookAuth.instance);
  // getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => MobileApiClient(getIt()));
  getIt.registerLazySingleton(() => WebApiClient(getIt()));

  getIt.registerLazySingleton(() {
    Dio dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(CustomInterceptors());
    return dio;
  });
}
