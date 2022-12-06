
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/filters_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

abstract class Repository {
  ///Login
  Future<Either<Failure, Map<UserEntity, bool?>>> signInWithGoogle();
  Future<Either<Failure, Map<UserEntity, bool?>>> signInWithFacebook();
  Future<Either<Failure, Salon>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failure, Salon>> signUpWithEmailAndPassword(String email, String password);
  Future<Either<Failure, String>> signUpWithLinkAndEmail(String email);
  Future<Either<Failure, void>> signInWithPhone(String phone);
  Future<Either<Failure, Map<UserEntity, bool?>>> verifyCode(String code, String phoneNumber);
  Future<Either<Failure, void>> changePassword(String oldPassword, String newPassword);

  Future<Either<Failure, void>> signOut();

  ///Users
  Future<Either<Failure, UserEntity>> getUser(String userId);
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user);
  Future<Either<Failure, String>> updateUserAvatar(File file);

  ///Salons
  Future<Either<Failure, List<Salon>>> getSalonsList(bool? loadTop, String? searchKey, int? page, int? limit, SearchFilters? searchFilters);
  Future<Either<Failure, Salon>> getSalonById(String salonId);
  Future<Either<Failure, Salon>> updateSalon(Salon salonEntity);
  Future<Either<Failure, String>> updateSalonPhoto(PickedFile file);


  ///AvailableTime
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByMasterId(
  //     String salonId, String masterId);
  //
  // Future<Either<Failure, List<AvailableTime>>> getAvailableTimesByServiceId(
  //     String salonId, String serviceId);

  ///Orders
  Future<Either<Failure, List<OrderEntity>>> getOrdersList(String id, OrderForType orderForType, String? dateFor, String? dateFrom, String? dateTo);
  Future<Either<Failure, List<OrderEntity>>> getAvailableTime(String salonId, String serviceId, String masterId, String date);
  Future<Either<Failure, void>> removeOrder(String orderId);
  Future<Either<Failure, OrderEntity>> updateOrder(OrderEntity orderEntity);
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity orderEntity);

  ///Services
  Future<Either<Failure, List<Service>>> getServicesList(String salonId, String? categoryId);
  Future<Either<Failure, Service>> addService(Service service);
  Future<Either<Failure, Service>> updateService(Service service);
  Future<Either<Failure, void>> removeService(String serviceId);

  ///Categories
  Future<Either<Failure, List<Category>>> getCategoryList(String salonId);
  Future<Either<Failure, Category>> addCategory(Category category);
  Future<Either<Failure, Category>> updateCategory(Category category);
  Future<Either<Failure, void>> removeCategory(String categoryId);

  ///Masters
  Future<Either<Failure, List<Master>>> getMastersList(String salonId, String? serviceId);
  Future<Either<Failure, void>> removeMaster(String masterId);
  Future<Either<Failure, Master>> updateMaster(Master master);
  Future<Either<Failure, Master>> addMaster(Master master);
  Future<Either<Failure, String>> updateMasterPhoto(String id, PickedFile file);

  ///Filters
  Future<Either<Failure, Filters>> addFilters(Filters filters);
  Future<Either<Failure, Filters>> getFilters();
  Future<Either<Failure, void>> removeFilters(String filterId) ;
  Future<Either<Failure, Filters>> updateFilters(Filters filters);

  ///Promo
  Future<Either<Failure, List<Promo>>> getPromoList(String salonId);
  Future<Either<Failure, Promo>> addPromo(Promo promo);
  Future<Either<Failure, Promo>> updatePromo(Promo promo);
  Future<Either<Failure, void>> removePromo(String promoId);
  Future<Either<Failure, String>> updatePromoPhoto(String id, PickedFile file);

  ///BonusCards
  Future<Either<Failure, List<BonusCard>>> getBonusCardList(String salonId);
  Future<Either<Failure, BonusCard>> addBonusCard(BonusCard bonusCard);
  Future<Either<Failure, BonusCard>> updateBonusCard(BonusCard bonusCard);
  Future<Either<Failure, void>> removeBonusCard(String cardId);

  ///Clients
  Future<Either<Failure, List<Client>>> getClientList(String salonId);
  Future<Either<Failure, Client>> addClient(Client client);
  Future<Either<Failure, Client>> updateClient(Client client);
  Future<Either<Failure, void>> removeClient(String clientId);
  Future<Either<Failure, String>> updateClientPhoto(String id, PickedFile file);

}