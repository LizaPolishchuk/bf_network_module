import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:salons_app_flutter_module/src/data/datasources/custom_interceptors.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/auth_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/tokens_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/user_response.dart';

import '../../../salons_app_flutter_module.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://salonsliza.herokuapp.com/api")
// @RestApi(baseUrl: "http://localhost:3999/api")

abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

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
  Future<BaseResponse> login(@Field("phone") String phone);

  @POST("/auth/loginVerify")
  @FormUrlEncoded()
  Future<AuthResponse> verifyCode(@Field("code") String code);

  @GET("/user")
  Future<UserResponse> getUser(@Query("userId") String userId);

  @POST("/user/update")
  Future<UserResponse> updateUser(@Body() UserEntity user);

  @POST("/user/delete/{userId}")
  Future<BaseResponse> deleteUser(@Path() String userId);

  @GET("/master/{salonId}")
  Future<BaseResponse> getMastersList(@Query("salonId") String salonId);

  @POST("/master/create")
  Future<BaseResponse> addMaster(@Body() Master master);

  @POST("/master/update")
  Future<BaseResponse> updateMaster(@Body() Master master);

  @POST("/master/delete/{masterId}")
  Future<BaseResponse> deleteMaster(@Path() String masterId);

  @GET("/order/{userId}")
  Future<BaseResponse> getOrdersList(@Query("userId") String userId);

  @POST("/order/create")
  Future<BaseResponse> addOrder(@Body() OrderEntity orderEntity);

  @POST("/order/update")
  Future<BaseResponse> updateOrder(@Body() OrderEntity orderEntity);

  @POST("/order/delete/{orderId}")
  Future<BaseResponse> deleteOrder(@Path() String orderId);

  @GET("/service/{salonId}")
  Future<BaseResponse> getServiceList(@Query("salonId") String salonId);

  @POST("/service/create")
  Future<BaseResponse> addService(@Body() Service service);

  @POST("/service/update")
  Future<BaseResponse> updateService(@Body() Service service);

  @POST("/service/delete/{serviceId}")
  Future<BaseResponse> deleteService(@Path() String serviceId);

  @GET("/salon")
  Future<BaseResponse> getSalonList();

  @POST("/salon/create")
  Future<BaseResponse> addSalon(@Body() Salon salon);

  @POST("/salon/update")
  Future<BaseResponse> updateSalon(@Body() Salon salon);

  @POST("/salon/delete/{salonId}")
  Future<BaseResponse> deleteSalon(@Path() String salonId);
}
