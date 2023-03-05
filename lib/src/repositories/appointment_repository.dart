import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';

class AppointmentRepository {
  final APIClient _apiClient;

  AppointmentRepository(this._apiClient);

  Future<BaseResponse> createAppointment(AppointmentEntity appointment) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.createAppointment(appointment);

    return response;
  }

  Future<AppointmentEntity> getAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getAppointment(uuid);

    return response;
  }

  Future<BaseResponse> updateAppointment(AppointmentEntity appointment) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateAppointment(appointment.id, appointment);

    return response;
  }

  Future<BaseResponse> deleteAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteAppointment(uuid);

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
