import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/entities/service_entity.dart';

class ServiceRepository {
  final APIClient _apiClient;

  ServiceRepository(this._apiClient);

  Future<BaseResponse> createService(Service service) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addService(service);

    return response;
  }

  Future<Service> getService(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getService(uuid);

    return response;
  }

  Future<BaseResponse> updateService(Service service) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateService(service.id, service);

    return response;
  }

  Future<BaseResponse> deleteService(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteService(uuid);

    return response;
  }

  Future<List<Master>> getServiceMasters(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getServiceMasters(uuid);

    return response;
  }

  Future<BaseResponse> changeServicePrice(String uuid, int price) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeServicePrice(uuid, {"price": price});

    return response;
  }

  Future<BaseResponse> changeServiceCategory(String uuid, String category) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeServiceCategory(uuid, {"category": category});

    return response;
  }

  Future<BaseResponse> changeServiceColor(String uuid, int color) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeServiceColor(uuid, {"category_color": color});

    return response;
  }

  Future<BaseResponse> changeServiceDuration(String uuid, int duration) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.changeServiceDuration(uuid, {"duration": duration});

    return response;
  }

//todo add response
// @GET("/service/get_free_slots/{uuid}")
// Future<BaseResponse> getServiceFreeSlots(@Path("uuid") String uuid);
}
