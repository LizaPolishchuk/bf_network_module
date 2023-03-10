import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:salons_app_flutter_module/src/entities/requests/create_appointment_request.dart';
import 'package:salons_app_flutter_module/src/utils/constants.dart';
import 'package:salons_app_flutter_module/src/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/entities/feedback_entity.dart';
import 'package:salons_app_flutter_module/src/entities/individual_appointment.dart';
import 'package:salons_app_flutter_module/src/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/entities/promo_entity.dart';
import 'package:salons_app_flutter_module/src/entities/requests/add_push_request.dart';
import 'package:salons_app_flutter_module/src/entities/requests/get_free_slots_request.dart';
import 'package:salons_app_flutter_module/src/entities/requests/like_salon_request.dart';
import 'package:salons_app_flutter_module/src/entities/requests/upload_photo_request.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/entities/responses/signed_url_response.dart';
import 'package:salons_app_flutter_module/src/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/entities/user_entity.dart';

part 'api_client.g.dart';

///prod
// @RestApi(baseUrl: "https://salonsliza.herokuapp.com/api")

///local
// @RestApi(baseUrl: "http://localhost:3999/api")

@RestApi(baseUrl: "http://${Constants.API_HOST}:${Constants.API_PORT}/api/v0")

abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @POST("/user/create")
  Future<BaseResponse> createUser(@Body() UserEntity user);

  @GET("/user/{userId}")
  Future<UserEntity> getUser(@Path("userId") String userId);

  @POST("/user/update/{userId}")
  Future<BaseResponse> updateUser(@Path("userId") String userId, @Body() UserEntity user);

  @POST("/user/delete/{userId}")
  Future<BaseResponse> deleteUser(@Path() String userId);

  @GET("/user/appointments/{userId}")
  Future<List<AppointmentEntity>> getUserAppointments(@Path("userId") String userId);

  @GET("/user/masters/{userId}")
  Future<List<Master>> getUserMasters(@Path("userId") String userId);

  @GET("/user/individual_appointments/{userId}")
  Future<List<IndividualAppointment>> getUserIndividualAppointments(@Path("userId") String userId);

  @GET("/user/favourites/{userId}")
  Future<List<Salon>> getUserFavouriteSalons(@Path("userId") String userId);

  @POST("/master/create")
  Future<BaseResponse> addMaster(@Body() Master master);

  @POST("/master/delete/{uuid}")
  Future<BaseResponse> deleteMaster(@Path("uuid") String uuid);

  @POST("/master/update/{uuid}")
  Future<BaseResponse> updateMaster(@Path("uuid") String uuid, @Body() Master master);

  @POST("/master/update_status/{uuid}")
  Future<BaseResponse> updateMasterStatus(@Path("uuid") String uuid, @Body() Map<String, String> request);

  @POST("/master/update_position/{uuid}")
  Future<BaseResponse> updateMasterPosition(@Path("uuid") String uuid, @Body() Map<String, String> request);

  @GET("/master/{uuid}")
  Future<Master> getMaster(@Path("uuid") String uuid);

  @GET("/master/{uuid}")
  Future<Master> getMasterInfo(@Path("uuid") String uuid); //master with list of services

  @GET("/master/services/{uuid}")
  Future<List<Service>> getMasterServices(@Path("uuid") String uuid);

  @GET("/master/appointments/{uuid}")
  Future<List<AppointmentEntity>> getMasterAppointments(@Path("uuid") String uuid);

  @GET("/master/clients/{uuid}")
  Future<List<UserEntity>> getMasterClients(@Path("uuid") String uuid);

  //todo add response
  @GET("/master/get_free_slots}")
  Future<BaseResponse> getMasterFreeSlots(@Body() GetFreeSlotsRequest getFreeSlotsRequest);

  @POST("/master/update_work_time/{uuid}")
  Future<BaseResponse> updateMasterWorkTime(@Path("uuid") String uuid, @Body() Map<String, int> request);

  // @POST("/master/add_master_to_service}")
  // Future<BaseResponse2> addMasterToService(@Path("uuid") String uuid, @Body() Master master);   {
//   "master_uuid": "string",
//   "service_uuid": "string"
// }

  @POST("/salon/create")
  Future<BaseResponse> addSalon(@Body() Salon salon);

  @POST("/salon/delete/{uuid}")
  Future<BaseResponse> deleteSalon(@Path() String uuid);

  @POST("/salon/update/{uuid}")
  Future<BaseResponse> updateSalon(@Path() String uuid, @Body() Salon salon);

  @GET("/salon/{uuid}")
  Future<Salon> getSalon(@Path("uuid") String uuid);

  @GET("/salon/services/{uuid}")
  Future<List<Service>> getSalonServices(@Path("uuid") String uuid);

  @GET("/salon/appointments/{uuid}")
  Future<List<AppointmentEntity>> getSalonAppointments(@Path("uuid") String uuid);

  @GET("/salon/clients/{uuid}")
  Future<List<UserEntity>> getSalonClients(@Path("uuid") String uuid);

  @GET("/salon/masters/{uuid}")
  Future<List<Master>> getSalonMasters(@Path("uuid") String uuid);

  @GET("/salon/promos/{uuid}")
  Future<List<Promo>> getSalonPromos(@Path("uuid") String uuid);

  @GET("/salon/feedbacks/{uuid}")
  Future<List<FeedbackEntity>> getSalonFeedbacks(@Path("uuid") String uuid);

  @POST("/appointment/create")
  Future<AppointmentEntity> createAppointment(@Body() CreateAppointmentRequest request);

  @POST("/appointment/delete/{uuid}")
  Future<BaseResponse> deleteAppointment(@Path("uuid") String uuid);

  @POST("/appointment/update/{uuid}")
  Future<AppointmentEntity> updateAppointment(@Path("uuid") String uuid, @Body() CreateAppointmentRequest request);

  @GET("/appointment/{uuid}")
  Future<AppointmentEntity> getAppointment(@Path("uuid") String uuid);

  @POST("/appointment/change_status/{uuid}")
  Future<BaseResponse> changeAppointmentStatus(@Path("uuid") String uuid, @Body() Map<String, String> request);

  @POST("/appointment/change_start_time/{uuid}")
  Future<BaseResponse> changeAppointmentStartTime(@Path("uuid") String uuid, @Body() Map<String, int> request);

  @POST("/favourite/like_salon")
  Future<BaseResponse> likeSalon(@Body() LikeSalonRequest likeSalonRequest);

  @POST("/feedback/create")
  Future<BaseResponse> addFeedback(@Body() FeedbackEntity feedback);

  @POST("/feedback/delete/{uuid}")
  Future<BaseResponse> deleteFeedback(@Path() String uuid);

  @POST("/feedback/update/{uuid}")
  Future<BaseResponse> updateFeedback(@Path() String uuid, @Body() FeedbackEntity feedback);

  @GET("/feedback/{uuid}")
  Future<FeedbackEntity> getFeedback(@Path("uuid") String uuid);

  @POST("/individual_appointment/create")
  Future<BaseResponse> createIndividualAppointment(@Body() IndividualAppointment appointment);

  @POST("/individual_appointment/delete/{uuid}")
  Future<BaseResponse> deleteIndividualAppointment(@Path("uuid") String uuid);

  @POST("/individual_appointment/update/{uuid}")
  Future<BaseResponse> updateIndividualAppointment(
      @Path("uuid") String uuid, @Body() IndividualAppointment appointment);

  @GET("/individual_appointment/{uuid}")
  Future<IndividualAppointment> getIndividualAppointment(@Path("uuid") String uuid);

  @GET("/media/signed_url}")
  Future<SignedUrlResponse> getSignedUrl();

  @POST("/media/upload_photo}")
  Future<BaseResponse> uploadPhoto(@Body() UploadPhotoRequest uploadPhotoRequest);

  @POST("/promo/create")
  Future<BaseResponse> addPromo(@Body() Promo promo);

  @POST("/promo/delete/{uuid}")
  Future<BaseResponse> deletePromo(@Path() String uuid);

  @POST("/promo/update/{uuid}")
  Future<BaseResponse> updatePromo(@Path() String uuid, @Body() Promo promo);

  @GET("/promo/{uuid}")
  Future<Promo> getPromo(@Path("uuid") String uuid);

  @POST("/push/create")
  Future<BaseResponse> addPush(@Body() AddPushRequest addPushRequest);

  @POST("/push/remove/{uuid}")
  Future<BaseResponse> deletePush(@Path() String uuid);

  @POST("/service/create")
  Future<BaseResponse> addService(@Body() Service service);

  @POST("/service/delete/{uuid}")
  Future<BaseResponse> deleteService(@Path() String uuid);

  @POST("/service/update/{uuid}")
  Future<BaseResponse> updateService(@Path() String uuid, @Body() Service service);

  @GET("/service/{uuid}")
  Future<Service> getService(@Path("uuid") String uuid);

  @GET("/service/masters/{uuid}")
  Future<List<Master>> getServiceMasters(@Path("uuid") String uuid);

  @POST("/service/change_price/{uuid}")
  Future<BaseResponse> changeServicePrice(@Path() String uuid, @Body() Map<String, int> request);

  @POST("/service/change_category/{uuid}")
  Future<BaseResponse> changeServiceCategory(@Path() String uuid, @Body() Map<String, String> request);

  @POST("/service/change_color/{uuid}")
  Future<BaseResponse> changeServiceColor(@Path() String uuid, @Body() Map<String, int> request);

  @POST("/service/change_duration/{uuid}")
  Future<BaseResponse> changeServiceDuration(@Path() String uuid, @Body() Map<String, int> request);

  //todo add response
  @GET("/service/get_free_slots/{uuid}")
  Future<BaseResponse> getServiceFreeSlots(@Path("uuid") String uuid);
}
