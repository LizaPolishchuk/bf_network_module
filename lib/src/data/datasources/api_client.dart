import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/auth_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response2.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/tokens_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/user_response.dart';

import '../../../salons_app_flutter_module.dart';

part 'api_client.g.dart';

///prod
@RestApi(baseUrl: "https://salonsliza.herokuapp.com/api")
///local
// @RestApi(baseUrl: "http://localhost:3999/api")

abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @POST("/authWeb/register")
  @FormUrlEncoded()
  Future<AuthResponse> signUpWeb(
      @Field("email") String email, @Field("password") String password);

  @POST("/authWeb/login")
  @FormUrlEncoded()
  Future<AuthResponse> loginWeb(
      @Field("email") String email, @Field("password") String password);

  @POST("/authWeb/refresh")
  @FormUrlEncoded()
  Future<TokensResponse> refreshTokenWeb(
      @Field("refreshToken") String refreshToken);

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

  @GET("/user")
  Future<UserResponse> getUser(@Query("userId") String userId);

  @POST("/user/update")
  Future<UserResponse> updateUser(@Body() UserEntity user);

  @POST("/user/delete/{userId}")
  Future<BaseResponse> deleteUser(@Path() String userId);

  @GET("/master/{salonId}")
  Future<BaseResponse2<List<Master>>> getMastersList(
      @Path("salonId") String salonId);

  @POST("/master/create")
  Future<BaseResponse2<Master>> addMaster(@Body() Master master);

  @POST("/master/update")
  Future<BaseResponse2<Master>> updateMaster(@Body() Master master);

  @DELETE("/master/delete/{masterId}")
  Future<BaseResponse2> deleteMaster(@Path("masterId") String masterId);

  @GET("/order/{id}")
  Future<BaseResponse2<List<OrderEntity>>> getOrdersList(
      @Path("id") String userId, @Queries() Map<String, String?> options);

  @GET("/order")
  Future<BaseResponse2<List<OrderEntity>>> getAvailableTimeList(
      @Query("salonId") String salonId,
      @Query("masterId") String masterId,
      @Query("serviceId") String serviceId,
      @Query("date") String date);

  @POST("/order/create")
  Future<BaseResponse2<OrderEntity>> addOrder(@Body() OrderEntity orderEntity);

  @POST("/order/update")
  Future<BaseResponse2<OrderEntity>> updateOrder(
      @Body() OrderEntity orderEntity);

  @DELETE("/order/delete/{orderId}")
  Future<BaseResponse2> deleteOrder(@Path("orderId") String orderId);

  @GET("/service/{salonId}")
  Future<BaseResponse2<List<Service>>> getServiceList(
      @Path("salonId") String salonId, @Query("categoryId") String categoryId);

  @POST("/service/create")
  Future<BaseResponse2<Service>> addService(@Body() Service service);

  @POST("/service/update")
  Future<BaseResponse2<Service>> updateService(@Body() Service service);

  @DELETE("/service/delete/{serviceId}")
  Future<BaseResponse2> deleteService(@Path("serviceId") String serviceId);

  @GET("/salon")
  Future<BaseResponse2<List<Salon>>> getSalonList(
      @Query("loadTop") bool? loadTop,
      @Query("searchKey") String? searchKey,
      @Query("page") int? page,
      @Query("limit") int? limit);

  @GET("/salon/{salonId}")
  Future<SalonResponse> getSalon(@Path("salonId") String salonId);

  @POST("/salon/create")
  Future<SalonResponse> addSalon(@Body() Salon salon);

  @POST("/salon/update")
  Future<SalonResponse> updateSalon(@Body() Salon salon);

  @POST("/salon/delete/{salonId}")
  Future<BaseResponse> deleteSalon(@Path() String salonId);

  @GET("/category/{salonId}")
  Future<BaseResponse2<List<Category>>> getCategoryList(
      @Path("salonId") String salonId);

  @POST("/category/create")
  Future<BaseResponse2<Category>> addCategory(@Body() Category category);

  @POST("/category/update")
  Future<BaseResponse2<Category>> updateCategory(@Body() Category category);

  @DELETE("/category/delete/{categoryId}")
  Future<BaseResponse2> deleteCategory(@Path("categoryId") String categoryId);
}
