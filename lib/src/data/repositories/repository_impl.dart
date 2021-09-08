import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/auth_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/masters_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/orders_remote_data_sourse.dart';
import 'package:salons_app_flutter_module/src/data/datasources/salons_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/data/datasources/user_remote_data_source.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalStorage localStorage;
  SalonsRemoteDataSource salonsRemoteDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  UserRemoteDataSource userRemoteDataSource;
  OrdersRemoteDataSource ordersRemoteDataSource;
  MastersRemoteDataSource mastersRemoteDataSource;

  RepositoryImpl(
      this.localStorage,
      this.salonsRemoteDataSource,
      this.authRemoteDataSource,
      this.userRemoteDataSource,
      this.ordersRemoteDataSource,
      this.mastersRemoteDataSource);

  @override
  Future<Either<Failure, String>> signInWithFacebook() async {
    try {
      UserEntity? user = await authRemoteDataSource.loginWithFacebook();

      String userId = await authRemoteDataSource.loginWithSocial(user);

      return Right(userId);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(Failure(message: error.message ?? "", codeStr: error.code));
      }
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      FirebaseAuth.User? firebaseUser = await authRemoteDataSource
          .signInWithEmailAndPassword(email, password);
      if (firebaseUser != null) {
        bool isUserPresent =
            await userRemoteDataSource.checkIsUserPresent(firebaseUser.uid);
        if (!isUserPresent) {
          // UserEntity user = new UserEntity(firebaseUser.uid, firebaseUser.displayName??"", firebaseUser.email,
          //     firebaseUser.photoURL);
          // userRemoteDataSource.createUser(user);
        }
        localStorage.setUserId(firebaseUser.uid);
        return Right(firebaseUser.uid);
      } else {
        return Left(Failure());
      }
    } catch (error) {
      if (error is FirebaseAuthException) {
        //ERROR_WEAK_PASSWORD - If the password is not strong enough.
        // ERROR_INVALID_EMAIL - If the email address is malformed.
        // ERROR_EMAIL_ALREADY_IN_USE - If the email is already in use by a different account.
        if (error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {}

        return Left(Failure(message: error.message ?? "", codeStr: error.code));
      }
      return Left(Failure(message: ""));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      FirebaseAuth.User? firebaseUser = await authRemoteDataSource
          .signUpWithEmailAndPassword(email, password);
      if (firebaseUser != null) {
        bool isUserPresent =
            await userRemoteDataSource.checkIsUserPresent(firebaseUser.uid);
        if (!isUserPresent) {
          // UserEntity user = new UserEntity(firebaseUser.uid, firebaseUser.displayName??"", firebaseUser.email,
          //     firebaseUser.photoURL);
          // userRemoteDataSource.createUser(user);
        }
        localStorage.setUserId(firebaseUser.uid);
        return Right(firebaseUser.uid);
      } else {
        return Left(Failure());
      }
    } catch (error) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPasswordNew(
      String email, String password) async {
    try {
      final result = await authRemoteDataSource.signUpWithEmailAndPasswordNew(
          email, password);

      return Right(result?.id ?? "");
    } catch (error) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      UserEntity? user = await authRemoteDataSource.loginWithGoogle();

      String userId = await authRemoteDataSource.loginWithSocial(user);

      return Right(userId);
    } catch (error) {
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
  Future<Either<Failure, List<Salon>>> getSalonsList(String salonId) async {
    try {
      List<Salon> salons = await salonsRemoteDataSource.getSalonsList(salonId);
      if (salonId.isNotEmpty) localStorage.setSalonId(salons.first.id);
      return Right(salons);
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
  Future<Either<Failure, List<OrderEntity>>> getCurrentUserOrdersList() async {
    try {
      return Right(await ordersRemoteDataSource.getCurrentUserOrdersList());
    } catch (error) {
      return Left(Failure(message: "Get orders list for user error"));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersList(
      String id, OrderForType orderForType) async {
    try {
      return Right(
          await ordersRemoteDataSource.getOrdersList(id, orderForType));
    } catch (error) {
      return Left(Failure(message: "Get orders list for $orderForType error"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.updateOrder(orderEntity));
    } catch (error) {
      return Left(Failure(message: "Update order error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeOrder(OrderEntity orderEntity) async {
    try {
      return Right(await ordersRemoteDataSource.removeOrder(orderEntity));
    } catch (error) {
      return Left(Failure(message: "Remove order error"));
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

  // @override
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByMasterId(
  //     String salonId, String masterId) async {
  //   try {
  //     return Right(await salonsRemoteDataSource.getAvailableTimesByMasterId(
  //         salonId, masterId));
  //   } catch(error) {
  //     return Left(Failure(message: "Get available times by masterId error"));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByServiceId(
  //     String salonId, String serviceId) async {
  //   try {
  //     return Right(await salonsRemoteDataSource.getAvailableTimesByServiceId(
  //         salonId, serviceId));
  //   } catch(error) {
  //     return Left(Failure(message: "Get available times by serviceId error"));
  //   }
  // }

  @override
  Future<Either<Failure, void>> sendLoginLinkToEmail(String email) async {
    try {
      return Right(await authRemoteDataSource.sendLinkForEmailSignIn(email));
    } catch (error) {
      return Left(Failure(message: "Send link to login error"));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithLinkAndEmail(String email) async {
    return Left(Failure(message: "In progress"));
  }

  @override
  Future<Either<Failure, List<Service>>> getServicesList(String salonId) async {
    try {
      return Right(await salonsRemoteDataSource.getServicesList(salonId));
    } catch (error) {
      return Left(Failure(message: "Get services list error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeService(
      String salonId, Service serviceEntity) async {
    try {
      return Right(
          await salonsRemoteDataSource.removeService(salonId, serviceEntity));
    } catch (error) {
      return Left(Failure(message: "Remove service error"));
    }
  }

  @override
  Future<Either<Failure, void>> updateService(
      String salonId, Service serviceEntity) async {
    try {
      return Right(
          await salonsRemoteDataSource.updateService(salonId, serviceEntity));
    } catch (error) {
      return Left(Failure(message: "Update service error"));
    }
  }

  @override
  Future<Either<Failure, List<Master>>> getMastersList(String salonId) async {
    try {
      return Right(await mastersRemoteDataSource.getMastersList(salonId));
    } catch (error) {
      return Left(Failure(message: "Get masters list error"));
    }
  }

  @override
  Future<Either<Failure, void>> removeMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.removeMaster(master));
    } catch (error) {
      return Left(Failure(message: "Remove master error"));
    }
  }

  @override
  Future<Either<Failure, void>> updateMaster(Master master) async {
    try {
      return Right(await mastersRemoteDataSource.updateMaster(master));
    } catch (error) {
      return Left(Failure(message: "Update master error"));
    }
  }

  @override
  Future<Either<Failure, bool?>> signInWithPhone(String phone) async {
    try {
      var a = await authRemoteDataSource.signInWithPhone(phone);
      return Right(a);
    } catch (error) {
      return Left(Failure(message: "Login with phone error"));
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode(String code) async {
    try {
      return Right(await authRemoteDataSource.verifyCode(code));
    } catch (error) {
      if (error is Failure) {
        return Left(error);
      }
      return Left(Failure(message: "Verify code error"));
    }
  }
}
