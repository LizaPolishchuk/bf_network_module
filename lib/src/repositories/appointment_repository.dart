import 'package:bf_network_module/src/api/api_client.dart';
import 'package:bf_network_module/src/entities/requests/create_appointment_request.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/appointment_entity.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

class AppointmentRepository {
  final APIClient _apiClient;

  AppointmentRepository(this._apiClient);

  Future<AppointmentEntity> createAppointment(CreateAppointmentRequest request) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.createAppointment(request);

    return response;
  }

  Future<AppointmentEntity> getAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getAppointment(uuid);

    return response;
  }

  Future<AppointmentEntity> updateAppointment(String appointmentId, CreateAppointmentRequest request) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateAppointment(appointmentId, request);

    return response;
  }

  Future<BaseResponse> deleteAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteAppointment(uuid);

    return response;
  }

  Future<List<AppointmentEntity>> getSalonAppointments(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonAppointments(uuid);

    return response;
  }

  Future<List<AppointmentEntity>> getUserAppointments(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUserAppointments(userId);

    return response;
  }

  Future<List<AppointmentEntity>> getMasterAppointments(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMasterAppointments(uuid);

    return response;
  }

  Future<BaseResponse> changeAppointmentStatus(String uuid, String status) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeAppointmentStatus(uuid, {"status" : status});

    return response;
  }

  Future<BaseResponse> changeAppointmentStartTime(String uuid, int startTime) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeAppointmentStartTime(uuid, {"start_time" : startTime});

    return response;
  }
}
