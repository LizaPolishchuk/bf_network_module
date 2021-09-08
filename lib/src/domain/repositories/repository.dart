
import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

abstract class Repository {
  ///Login
  Future<Either<Failure, String>> signInWithGoogle();
  Future<Either<Failure, String>> signInWithFacebook();
  Future<Either<Failure, String>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failure, String>> signUpWithEmailAndPassword(String email, String password);
  Future<Either<Failure, String>> signUpWithEmailAndPasswordNew(String email, String password);
  Future<Either<Failure, String>> signUpWithLinkAndEmail(String email);
  Future<Either<Failure, bool?>> signInWithPhone(String phone);
  Future<Either<Failure, String>> verifyCode(String code);
  Future<Either<Failure, void>> sendLoginLinkToEmail(String email);

  Future<Either<Failure, void>> signOut();

  ///Salons
  Future<Either<Failure, List<Salon>>> getSalonsList(String userId);

  Future<Either<Failure, Salon>> getSalonById(String salonId);
  Future<Either<Failure, Salon>> updateSalon(Salon salonEntity);

  ///AvailableTime
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByMasterId(
  //     String salonId, String masterId);
  //
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByServiceId(
  //     String salonId, String serviceId);

  ///Orders
  Future<Either<Failure, List<OrderEntity>>> getCurrentUserOrdersList();
  Future<Either<Failure, List<OrderEntity>>> getOrdersList(String id, OrderForType orderForType);
  Future<Either<Failure, void>> removeOrder(OrderEntity orderEntity);
  Future<Either<Failure, void>> updateOrder(OrderEntity orderEntity);

  ///Services
  Future<Either<Failure, List<Service>>> getServicesList(String salonId);
  Future<Either<Failure, void>> removeService(String salonId, Service serviceEntity);
  Future<Either<Failure, void>> updateService(String salonId, Service serviceEntity);

  ///Masters
  Future<Either<Failure, List<Master>>> getMastersList(String salonId);
  Future<Either<Failure, void>> removeMaster(Master master);
  Future<Either<Failure, void>> updateMaster(Master master);

}