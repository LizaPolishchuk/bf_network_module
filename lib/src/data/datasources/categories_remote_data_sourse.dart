import 'package:bf_network_module/src/common/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';
import 'package:bf_network_module/src/domain/entities/category_entity.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getCategoriesList(String salonId);

  Future<Category> addCategory(Category category);

  Future<Category> updateCategory(Category category);

  Future<void> removeCategory(String categoryId);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  const CategoryRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<Category>> getCategoriesList(String salonId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getCategoryList(salonId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getCategoriesList error: data is null"));
    }

    _localStorage.setCategoriesList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Category> addCategory(Category category) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addCategory(category);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Category> updateCategory(Category category) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateCategory(category);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateCategory error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeCategory(String categoryId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteCategory(categoryId);

    return;
  }
}
