import 'package:bf_network_module/src/api/api_client_mobile.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/individual_appointment.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

class IndividualAppointmentRepository {
  final MobileApiClient _apiClient;

  IndividualAppointmentRepository(this._apiClient);

  Future<BaseResponse> createIndividualIndividualAppointment(IndividualAppointment appointment) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.createIndividualAppointment(appointment);

    return response;
  }

  Future<IndividualAppointment> getIndividualAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getIndividualAppointment(uuid);

    return response;
  }

  Future<BaseResponse> updateIndividualAppointment(IndividualAppointment appointment) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateIndividualAppointment(appointment.id, appointment);

    return response;
  }

  Future<BaseResponse> deleteIndividualAppointment(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteIndividualAppointment(uuid);

    return response;
  }
}
