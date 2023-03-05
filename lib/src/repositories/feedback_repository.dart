import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/feedback_entity.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';

class FeedbackRepository {
  final APIClient _apiClient;

  FeedbackRepository(this._apiClient);

  Future<BaseResponse> createFeedback(FeedbackEntity feedback) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addFeedback(feedback);

    return response;
  }

  Future<FeedbackEntity> getFeedback(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getFeedback(userId);

    return response;
  }

  Future<BaseResponse> updateFeedback(FeedbackEntity feedback) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateFeedback(feedback.id, feedback);

    return response;
  }

  Future<BaseResponse> deleteFeedback(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteFeedback(userId);

    return response;
  }
}
