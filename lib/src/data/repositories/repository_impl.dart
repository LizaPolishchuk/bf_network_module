import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salons_app_flutter_module/src/data/datasources/auth_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/categories_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/filters_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/masters_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/orders_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/salons_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/services_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/user_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

import '../../../salons_app_flutter_module.dart';

class RepositoryImpl implements Repository {
  SalonsRemoteDataSource salonsRemoteDataSource;
  ServiceRemoteDataSource serviceRemoteDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  UserRemoteDataSource userRemoteDataSource;
  OrdersRemoteDataSource ordersRemoteDataSource;
  MastersRemoteDataSource mastersRemoteDataSource;
  CategoryRemoteDataSource categoryRemoteDataSource;
  FiltersRemoteDataSource filtersRemoteDataSource;

  RepositoryImpl(
      this.salonsRemoteDataSource,
      this.authRemoteDataSource,
      this.userRemoteDataSource,
      this.ordersRemoteDataSource,
      this.serviceRemoteDataSource,
      this.mastersRemoteDataSource,
      this.categoryRemoteDataSource,
      this.filtersRemoteDataSource);

  @override
  Future<Either<Failure, Map<UserEntity, bool?>>> signInWithFacebook() async {
    try {
      UserEntity? user = await authRemoteDataSource.loginWithFacebook();

      Map<UserEntity, bool?> response =
          await authRemoteDataSource.loginWithSocial(user);

      return Right(response);
    } catch (error) {
      debugPrint("signInWithFacebook error $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<UserEntity, bool?>>> signInWithGoogle() async {
    try {
      UserEntity? user = await authRemoteDataSource.loginWithGoogle();

      Map<UserEntity, bool?> response =
          await authRemoteDataSource.loginWithSocial(user);

      return Right(response);
    } catch (error) {
      debugPrint("signInWithGoogle error $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Salon>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await authRemoteDataSource.signInWithEmailAndPassword(
          email, password);

      return Right(result);
    } catch (error) {
      debugPrint("signInWithEmailAndPassword error $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Salon>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await authRemoteDataSource.signUpWithEmailAndPassword(
          email, password);

      return Right(result);
    } catch (error) {
      debugPrint("signUpWithEmailAndPassword error $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await authRemoteDataSource.signOut());
    } catch (error) {
      debugPrint("signOut error $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Salon>>> getSalonsList(
      bool? loadTop, String? searchKey, int? page, int? limit, SearchFilters? searchFilters) async {
    try {
      return Right(await salonsRemoteDataSource.getSalonsList(
          loadTop, searchKey, page, limit, searchFilters));
    } catch (error) {
      debugPrint("getSalonsList error $error");
      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, Salon>> updateSalon(Salon salonEntity) async {
    try {
      return Right(await salonsRemoteDataSource.updateSalon(salonEntity));
    } catch (error) {
      debugPrint("updateSalon error $error");
      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersList(
      String id, OrderForType orderForType, String? dateFor, String? dateFrom, String? dateTo) async {
    try {
      return Right(
          await ordersRemoteDataSource.getOrdersList(id, orderForType, dateFor, dateFrom, dateTo));
    } catch (error) {
      debugPrint("getOrdersList error $error");

      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getAvailableTime(String salonId, String serviceId, String masterId, String date) async {
    try {
      return Right(
          await ordersRemoteDataSource.getAvailableTime(salonId, serviceId, masterId, date));
    } catch (error) {
      debugPrint("getAvailableTime error $error");

      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrder(
      OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.updateOrder(orderEntity));
    } catch (error) {
      debugPrint("updateOrder error $error");

      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.addOrder(orderEntity));
    } catch (error) {
      debugPrint("addOrder error $error");

      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeOrder(String orderId) async {
    try {
      return Right(await ordersRemoteDataSource.removeOrder(orderId));
    } catch (error) {
      debugPrint("removeOrder error $error");

      return Left(Failure(message:error.toString()));
    }
  }

  @override
  Future<Either<Failure, Salon>> getSalonById(String salonId) async {
    try {
      return Right(await salonsRemoteDataSource.getSalonById(salonId));
    } catch (error) {
      debugPrint("getSalonById error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithLinkAndEmail(String email) async {
    return Left(Failure(message: "In progress"));
  }

  @override
  Future<Either<Failure, List<Service>>> getServicesList(String salonId, String categoryId) async {
    try {
      return Right(await serviceRemoteDataSource.getServicesList(salonId, categoryId));
    } catch (error) {
      debugPrint("getServicesList error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeService(String serviceId) async {
    try {
      return Right(await serviceRemoteDataSource.removeService(serviceId));
    } catch (error) {
      debugPrint("removeService error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Service>> updateService(Service service) async {
    try {
      return Right(await serviceRemoteDataSource.updateService(service));
    } catch (error) {
      debugPrint("updateService error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Master>>> getMastersList(String salonId) async {
    try {
      return Right(await mastersRemoteDataSource.getMastersList(salonId));
    } catch (error) {
      debugPrint("getMastersList error: $error");
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeMaster(String masterId) async {
    try {
      return Right(await mastersRemoteDataSource.removeMaster(masterId));
    } catch (error) {
      debugPrint("removeMaster error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Master>> updateMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.updateMaster(master));
    } catch (error) {
      debugPrint("updateMaster error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Master>> addMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.addMaster(master));
    } catch (error) {
      debugPrint("addMaster error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithPhone(String phone) async {
    try {
      return Right(await authRemoteDataSource.signInWithPhone(phone));
    } catch (error) {
      debugPrint("signInWithPhone error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<UserEntity, bool?>>> verifyCode(
      String code, String phoneNumber) async {
    try {
      return Right(await authRemoteDataSource.verifyCode(code, phoneNumber));
    } catch (error) {
      debugPrint("verifyCode error $error");

      if (error is Failure && error.codeStr == "invalid-verification-code") {
        return Left(error);
      }
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String userId) async {
    try {
      return Right(await userRemoteDataSource.getUser(userId));
    } catch (error) {
      debugPrint("getUser error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user) async {
    try {
      return Right(await userRemoteDataSource.updateUser(user));
    } catch (error) {
      debugPrint("updateUser error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserAvatar(File file) async {
    try {
      return Right(await userRemoteDataSource.updateUserAvatar(file));
    } catch (error) {
      debugPrint("updateUserAvatar error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateSalonPhoto(PickedFile file) async {
    try {
      return Right(await salonsRemoteDataSource.updateSalonPhoto(file));
    } catch (error) {
      debugPrint("updateSalonPhoto error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Service>> addService(Service service) async {
    try {
      return Right(await serviceRemoteDataSource.addService(service));
    } catch (error) {
      debugPrint("addService error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Category>> addCategory(Category category) async {
    try {
      return Right(await categoryRemoteDataSource.addCategory(category));
    } catch (error) {
      debugPrint("addCategory error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoryList(
      String salonId) async {
    try {
      return Right(await categoryRemoteDataSource.getCategoriesList(salonId));
    } catch (error) {
      debugPrint("getCategoryList error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeCategory(String categoryId) async {
    try {
      return Right(await categoryRemoteDataSource.removeCategory(categoryId));
    } catch (error) {
      debugPrint("removeCategory error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Category>> updateCategory(Category category) async {
    try {
      return Right(await categoryRemoteDataSource.updateCategory(category));
    } catch (error) {
      debugPrint("updateCategory error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Filters>> addFilters(Filters filters) async {
    try {
      return Right(await filtersRemoteDataSource.addFilters(filters));
    } catch (error) {
      debugPrint("addFilters error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Filters>> getFilters() async {
    try {
      var filters = await filtersRemoteDataSource.getFilters();
      print("getFilters succes: $filters");
      return Right(filters);
    } catch (error) {
      debugPrint("getFilters error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFilters(String filterId) async {
    try {
      return Right(await filtersRemoteDataSource.removeFilters(filterId));
    } catch (error) {
      debugPrint("removeFilters error $error");

      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Filters>> updateFilters(Filters filters) async {
    try {
      return Right(await filtersRemoteDataSource.updateFilters(filters));
    } catch (error) {
      debugPrint("updateFilters error $error");

      return Left(Failure(message: error.toString()));
    }
  }
}
