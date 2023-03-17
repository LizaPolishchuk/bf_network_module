import 'package:bf_network_module/src/api/api_client.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/appointment_entity.dart';
import 'package:bf_network_module/src/entities/master_entity.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';
import 'package:bf_network_module/src/entities/service_entity.dart';
import 'package:bf_network_module/src/entities/user_entity.dart';

class MasterRepository {
  final APIClient _apiClient;

  MasterRepository(this._apiClient);

  Future<BaseResponse> createMaster(Master master) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addMaster(master);

    return response;
  }

  Future<Master> getMaster(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMaster(uuid);

    return response;
  }

  Future<Master> getMasterInfo(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMasterInfo(uuid);

    return response;
  }

  Future<BaseResponse> updateMaster(Master master) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateMaster(master.id, master);

    return response;
  }

  Future<BaseResponse> updateMasterStatus(String id, MasterStatus status) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateMasterStatus(id, {"status": status.name});

    return response;
  }

  Future<BaseResponse> updateMasterPosition(String id, String position) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateMasterPosition(id, {"position": position});

    return response;
  }

  Future<BaseResponse> updateMasterWorkTime(String id, {required int workStartTime, required int workEndTime}) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateMasterWorkTime(id, {
      "work_start_time": workStartTime,
      "work_end_time": workEndTime,
    });

    return response;
  }

  Future<BaseResponse> deleteMaster(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteMaster(uuid);

    return response;
  }

  Future<List<Service>> getMasterServices(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMasterServices(uuid);

    return response;
  }

  Future<List<UserEntity>> getMasterClients(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMasterClients(uuid);

    return response;
  }

  Future<List<Master>> getSalonMasters(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonMasters(uuid);

    return response;
  }

//todo add response
// @GET("/master/get_free_slots}")
// Future<BaseResponse> getMasterFreeSlots(@Body() GetFreeSlotsRequest getFreeSlotsRequest);

// @POST("/master/add_master_to_service}")
// Future<BaseResponse2> addMasterToService(@Path("uuid") String uuid, @Body() Master master);   {
//   "master_uuid": "string",
//   "service_uuid": "string"
// }
}
