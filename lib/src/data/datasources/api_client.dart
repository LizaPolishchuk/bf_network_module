import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:bf_network_module/src/domain/entities/responses/auth_response.dart';
import 'package:bf_network_module/src/domain/entities/responses/base_response.dart';
import 'package:bf_network_module/src/domain/entities/responses/base_response2.dart';
import 'package:bf_network_module/src/domain/entities/responses/salon_response.dart';
import 'package:bf_network_module/src/domain/entities/responses/tokens_response.dart';
import 'package:bf_network_module/src/domain/entities/responses/user_response.dart';
import 'package:bf_network_module/src/utils/constants.dart';

import '../../../bf_network_module.dart';

part 'api_client.g.dart';

///prod
// @RestApi(baseUrl: "https://salonsliza.herokuapp.com/api")

///local
// @RestApi(baseUrl: "http://localhost:3999/api")

@RestApi(baseUrl: "http://${Constants.API_HOST}:${Constants.API_PORT}/api")

abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @POST("/authWeb/register")
  @FormUrlEncoded()
  Future<AuthResponse> signUpWeb(@Field("email") String email, @Field("password") String password);

  @POST("/authWeb/login")
  @FormUrlEncoded()
  Future<AuthResponse> loginWeb(@Field("email") String email, @Field("password") String password);

  @POST("/authWeb/refresh")
  @FormUrlEncoded()
  Future<TokensResponse> refreshTokenWeb(@Field("refreshToken") String refreshToken);

  @POST("/authWeb/forgot")
  @FormUrlEncoded()
  Future<BaseResponse> forgotPassword(@Field("email") String email);

  @POST("/auth/social")
  Future<AuthResponse> loginWithSocial(@Body() UserEntity user);

  @POST("/auth/login")
  @FormUrlEncoded()
  Future<AuthResponse> login(@Field("phone") String phone);

  @POST("/auth/loginVerify")
  @FormUrlEncoded()
  Future<AuthResponse> verifyCode(@Field("code") String code, @Field("phone") String phoneNumber);

  @GET("/user/{userId}")
  Future<UserResponse> getUser(@Path("userId") String userId);

  @POST("/user/update")
  Future<UserResponse> updateUser(@Body() UserEntity user);

  @POST("/user/delete/{userId}")
  Future<BaseResponse> deleteUser(@Path() String userId);

  @GET("/master/{salonId}")
  Future<BaseResponse2<List<Master>>> getMastersList(
      @Path("salonId") String salonId, @Query("serviceId") String? serviceId);

  @POST("/master/create")
  Future<BaseResponse2<Master>> addMaster(@Body() Master master);

  @POST("/master/update")
  Future<BaseResponse2<Master>> updateMaster(@Body() Master master);

  @DELETE("/master/delete/{masterId}")
  Future<BaseResponse2> deleteMaster(@Path("masterId") String masterId);

  @GET("/order/list")
  Future<BaseResponse2<List<OrderEntity>>> getOrdersList(@Queries() Map<String, String?> options);

  @GET("/order")
  Future<BaseResponse2<List<OrderEntity>>> getAvailableTimeList(@Query("salonId") String salonId,
      @Query("masterId") String masterId, @Query("serviceId") String serviceId, @Query("date") String date);

  @POST("/order/create")
  Future<BaseResponse2<OrderEntity>> addOrder(@Body() OrderEntity orderEntity);

  @POST("/order/update")
  Future<BaseResponse2<OrderEntity>> updateOrder(@Body() OrderEntity orderEntity);

  @DELETE("/order/delete/{orderId}")
  Future<BaseResponse2> deleteOrder(@Path("orderId") String orderId);

  @GET("/service/{salonId}")
  Future<BaseResponse2<List<Service>>> getServiceList(
      @Path("salonId") String salonId, @Query("categoryId") String? categoryId);

  @POST("/service/create")
  Future<BaseResponse2<Service>> addService(@Body() Service service);

  @POST("/service/update")
  Future<BaseResponse2<Service>> updateService(@Body() Service service);

  @DELETE("/service/delete/{serviceId}")
  Future<BaseResponse2> deleteService(@Path("serviceId") String serviceId);

  @GET("/client/{salonId}")
  Future<BaseResponse2<List<Client>>> getClientList(@Path("salonId") String salonId);

  @POST("/client/create")
  Future<BaseResponse2<Client>> addClient(@Body() Client client);

  @POST("/client/update")
  Future<BaseResponse2<Client>> updateClient(@Body() Client client);

  @DELETE("/client/delete/{clientId}")
  Future<BaseResponse2> deleteClient(@Path("clientId") String clientId);

  @GET("/promo/{salonId}")
  Future<BaseResponse2<List<Promo>>> getPromoList(@Path("salonId") String salonId);

  @POST("/promo/create")
  Future<BaseResponse2<Promo>> addPromo(@Body() Promo promo);

  @POST("/promo/update")
  Future<BaseResponse2<Promo>> updatePromo(@Body() Promo promo);

  @DELETE("/promo/delete/{promoId}")
  Future<BaseResponse2> deletePromo(@Path("promoId") String promoId);

  @GET("/bonusCard/{salonId}")
  Future<BaseResponse2<List<BonusCard>>> getBonusCardList(@Path("salonId") String salonId);

  @POST("/bonusCard/create")
  Future<BaseResponse2<BonusCard>> addBonusCard(@Body() BonusCard bonusCard);

  @POST("/bonusCard/update")
  Future<BaseResponse2<BonusCard>> updateBonusCard(@Body() BonusCard bonusCard);

  @DELETE("/bonusCard/delete/{cardId}")
  Future<BaseResponse2> deleteBonusCard(@Path("cardId") String cardId);

  @GET("/salon")
  Future<BaseResponse2<List<Salon>>> getSalonList(
    @Query("loadTop") bool? loadTop,
    @Query("searchKey") String? searchKey,
    @Query("page") int? page,
    @Query("limit") int? limit,
    @Queries() Map<String, dynamic>? searchFilters,
    // @Body() SearchFilters? searchFilters
  );

  @GET("/salon/{salonId}")
  Future<SalonResponse> getSalon(@Path("salonId") String salonId);

  @POST("/salon/create")
  Future<SalonResponse> addSalon(@Body() Salon salon);

  @POST("/salon/update")
  Future<SalonResponse> updateSalon(@Body() Salon salon);

  @POST("/salon/delete/{salonId}")
  Future<BaseResponse> deleteSalon(@Path() String salonId);

  @GET("/category/{salonId}")
  Future<BaseResponse2<List<Category>>> getCategoryList(@Path("salonId") String salonId);

  @POST("/category/create")
  Future<BaseResponse2<Category>> addCategory(@Body() Category category);

  @POST("/category/update")
  Future<BaseResponse2<Category>> updateCategory(@Body() Category category);

  @DELETE("/category/delete/{categoryId}")
  Future<BaseResponse2> deleteCategory(@Path("categoryId") String categoryId);

  @GET("/filters")
  Future<BaseResponse2<Filters>> getFilters();

  @POST("/filters/create")
  Future<BaseResponse2<Filters>> addFilters(@Body() Filters filter);

  @POST("/filters/update")
  Future<BaseResponse2<Filters>> updateFilters(@Body() Filters filter);

  @DELETE("/filters/delete/{filterId}")
  Future<BaseResponse2> deleteFilters(@Path("filterId") String filterId);
}
