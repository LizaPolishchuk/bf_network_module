import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/auth_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/categories_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/masters_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/orders_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/salons_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/services_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/user_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalStorage localStorage;
  SalonsRemoteDataSource salonsRemoteDataSource;
  ServiceRemoteDataSource serviceRemoteDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  UserRemoteDataSource userRemoteDataSource;
  OrdersRemoteDataSource ordersRemoteDataSource;
  MastersRemoteDataSource mastersRemoteDataSource;
  CategoryRemoteDataSource categoryRemoteDataSource;

  RepositoryImpl(
      this.localStorage,
      this.salonsRemoteDataSource,
      this.authRemoteDataSource,
      this.userRemoteDataSource,
      this.ordersRemoteDataSource,
      this.serviceRemoteDataSource,
      this.mastersRemoteDataSource,
      this.categoryRemoteDataSource);

  @override
  Future<Either<Failure, Map<UserEntity, bool?>>> signInWithFacebook() async {
    try {
      UserEntity? user = await authRemoteDataSource.loginWithFacebook();

      Map<UserEntity, bool?> response =
          await authRemoteDataSource.loginWithSocial(user);

      return Right(response);
    } catch (error) {
      return Left(Failure());
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
      return Left(Failure());
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
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure());
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
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await authRemoteDataSource.signOut());
    } catch (error) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Salon>>> getSalonsList(
      bool? loadTop, String? searchKey, int? page, int? limit) async {
    try {
      return Right(await salonsRemoteDataSource.getSalonsList(
          loadTop, searchKey, page, limit));
    } catch (error) {
      return Left(Failure(message: "Get salons list error"));
    }
  }

  @override
  Future<Either<Failure, Salon>> updateSalon(Salon salonEntity) async {
    try {
      return Right(await salonsRemoteDataSource.updateSalon(salonEntity));
    } catch (error) {
      return Left(Failure(message: "Get salons list error: $error"));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersList(
      String id, OrderForType orderForType, String? dateFor, String? dateFrom, String? dateTo) async {
    try {
      return Right(
          await ordersRemoteDataSource.getOrdersList(id, orderForType, dateFor, dateFrom, dateTo));
    } catch (error) {
      return Left(Failure(message: "Get orders list for $orderForType error"));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getAvailableTime(String salonId, String serviceId, String masterId, String date) async {
    try {
      return Right(
          await ordersRemoteDataSource.getAvailableTime(salonId, serviceId, masterId, date));
    } catch (error) {
      return Left(Failure(message: "Get orders list for error"));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrder(
      OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.updateOrder(orderEntity));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "updateOrder error"));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.addOrder(orderEntity));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "addOrder error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeOrder(String orderId) async {
    try {
      return Right(await ordersRemoteDataSource.removeOrder(orderId));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "removeOrder error"));
    }
  }

  @override
  Future<Either<Failure, Salon>> getSalonById(String salonId) async {
    try {
      return Right(await salonsRemoteDataSource.getSalonById(salonId));
    } catch (error) {
      return Left(Failure(message: "Get salon by id error"));
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
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "getServicesList error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeService(String serviceId) async {
    try {
      return Right(await serviceRemoteDataSource.removeService(serviceId));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "removeService error"));
    }
  }

  @override
  Future<Either<Failure, Service>> updateService(Service service) async {
    try {
      return Right(await serviceRemoteDataSource.updateService(service));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "updateService error"));
    }
  }

  @override
  Future<Either<Failure, List<Master>>> getMastersList(String salonId) async {
    try {
      return Right(await mastersRemoteDataSource.getMastersList(salonId));
    } catch (error) {
      print("getMastersList error: ${error}");
      return Left(Failure(message: "Get masters list error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeMaster(String masterId) async {
    try {
      return Right(await mastersRemoteDataSource.removeMaster(masterId));
    } catch (error) {
      return Left(Failure(message: "Remove master error"));
    }
  }

  @override
  Future<Either<Failure, Master>> updateMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.updateMaster(master));
    } catch (error) {
      return Left(Failure(message: "Update master error"));
    }
  }

  @override
  Future<Either<Failure, Master>> addMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.addMaster(master));
    } catch (error) {
      return Left(Failure(message: "Add master error"));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithPhone(String phone) async {
    try {
      return Right(await authRemoteDataSource.signInWithPhone(phone));
    } catch (error) {
      return Left(Failure(message: "Login with phone error"));
    }
  }

  @override
  Future<Either<Failure, Map<UserEntity, bool?>>> verifyCode(
      String code, String phoneNumber) async {
    try {
      return Right(await authRemoteDataSource.verifyCode(code, phoneNumber));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Verify code error"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String userId) async {
    try {
      return Right(await userRemoteDataSource.getUser(userId));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "getUser error"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user) async {
    try {
      return Right(await userRemoteDataSource.updateUser(user));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "updateUser error"));
    }
  }

  @override
  Future<Either<Failure, Service>> addService(Service service) async {
    try {
      return Right(await serviceRemoteDataSource.addService(service));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "addService error"));
    }
  }

  @override
  Future<Either<Failure, Category>> addCategory(Category category) async {
    try {
      return Right(await categoryRemoteDataSource.addCategory(category));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Add category error"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoryList(
      String salonId) async {
    try {
      return Right(await categoryRemoteDataSource.getCategoriesList(salonId));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Get categories list error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeCategory(String categoryId) async {
    try {
      return Right(await categoryRemoteDataSource.removeCategory(categoryId));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Remove category error"));
    }
  }

  @override
  Future<Either<Failure, Category>> updateCategory(Category category) async {
    try {
      return Right(await categoryRemoteDataSource.updateCategory(category));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Update category error"));
    }
  }
}
