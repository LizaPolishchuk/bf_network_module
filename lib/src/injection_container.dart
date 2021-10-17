import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/data/datasources/categories_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/services_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/categories/add_category_use_case.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/categories/get_categories_list_use_case.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/categories/remove_category_use_case.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/categories/update_category_use_case.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/masters/add_master_use_case.dart';
import 'package:salons_app_flutter_module/src/domain/usecases/orders/add_order_use_case.dart';

import 'data/caches/local_starage.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/custom_interceptors.dart';
import 'data/datasources/masters_remote_data_sourse.dart';
import 'data/datasources/orders_remote_data_sourse.dart';
import 'data/datasources/salons_remote_data_source.dart';
import 'data/datasources/user_remote_data_source.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/usecases/login/login_with_email_and_password_usecase.dart';
import 'domain/usecases/login/login_with_facebook_usecase.dart';
import 'domain/usecases/login/login_with_google_usecase.dart';
import 'domain/usecases/login/login_with_phone_usecase.dart';
import 'domain/usecases/login/login_with_phone_verify_code_usecase.dart';
import 'domain/usecases/login/send_login_link_to_email_usecase.dart';
import 'domain/usecases/login/sign_out_usecase.dart';
import 'domain/usecases/login/sign_up_with_link_and_email_usecase.dart';
import 'domain/usecases/login/signup_with_email_and_password_usecase.dart';
import 'domain/usecases/masters/get_masters_list_use_case.dart';
import 'domain/usecases/masters/remove_master_use_case.dart';
import 'domain/usecases/masters/update_master_use_case.dart';
import 'domain/usecases/orders/get_orders_list_for_current_user.dart';
import 'domain/usecases/orders/get_orders_list_usecase.dart';
import 'domain/usecases/orders/remove_order_use_case.dart';
import 'domain/usecases/orders/update_order_use_case.dart';
import 'domain/usecases/salons/get_salon_by_id_use_case.dart';
import 'domain/usecases/salons/get_salons_list_use_case.dart';
import 'domain/usecases/salons/update_salon_use_case.dart';
import 'domain/usecases/services/add_service_use_case.dart';
import 'domain/usecases/services/get_services_list_use_case.dart';
import 'domain/usecases/services/remove_service_use_case.dart';
import 'domain/usecases/services/update_service_use_case.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Repository
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));

  ///Data sources
  getIt.registerLazySingleton<SalonsRemoteDataSource>(
      () => SalonsRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(getIt(), getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<MastersRemoteDataSource>(
      () => MastersRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<ServiceRemoteDataSource>(
      () => ServicesRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(getIt(), getIt()));

  ///Use Cases
  getIt.registerLazySingleton(() => GetSalonsListUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithFacebookUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithGoogleUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithEmailAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => SignOutUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrdersListForCurrentUser(getIt()));
  getIt.registerLazySingleton(() => GetSalonByIdUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrdersListUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateOrderUseCase(getIt()));
  getIt.registerLazySingleton(() => AddOrderUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveOrderUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateSalonUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpWithLinkAndEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => SendLoginLinkEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => GetServicesListUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateServiceUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveServiceUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMastersListUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateMasterUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveMasterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithPhoneVerifyCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithPhoneUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateUserUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserUseCase(getIt()));
  getIt.registerLazySingleton(() => AddMasterUseCase(getIt()));
  getIt.registerLazySingleton(() => AddServiceUseCase(getIt()));
  getIt.registerLazySingleton(() => AddCategoryUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateCategoryUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveCategoryUseCase(getIt()));
  getIt.registerLazySingleton(() => GetCategoriesListUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAvailableTimeUseCase(getIt()));

  ///External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => LocalStorage());

  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => GoogleSignIn());
  getIt.registerLazySingleton(() => FacebookAuth.instance);
  getIt.registerLazySingleton(() => APIClient(getIt()));

  getIt.registerLazySingleton(() {
    Dio dio = Dio();
    dio.options.contentType= Headers.jsonContentType;
    dio.interceptors.add(CustomInterceptors());
    return dio;
  });

  getIt.registerLazySingleton<Reference>(() =>
      FirebaseStorage.instance.refFromURL('gs://salons-5012c.appspot.com'));
}
