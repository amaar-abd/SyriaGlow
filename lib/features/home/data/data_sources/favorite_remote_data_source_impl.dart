import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/features/home/data/data_sources/favorite_remote_data_source.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  const FavoriteRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;
 
  @override
  Future<String> addFavoriteItem({required String landmarkId}) async {
    try {
      final String? token = await sl<SecureStorageService>().read(AppConstants.authToken);
    final response =  await apiService.post(
        ApiConstants.addFavorite,
        body: {'landmark_id': landmarkId},
        headers: {
          'Authorization': 'Bearer $token', 
        },
      );
      return response['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteFavoriteItem({required String landmarkId}) async {
    try {
      final String? token = await sl<SecureStorageService>().read(AppConstants.authToken);
     final response =   await apiService.delete(
        ApiConstants.deleteFavorite,
        queryParameters: {'landmark_id': landmarkId},
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      
      return response['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LandMarkResponse> getFavoriteItems() async {
    try {
      final String? token = await sl<SecureStorageService>().read(AppConstants.authToken);
      final response = await apiService.get(ApiConstants.getFavorites,headers: {
          'Authorization': 'Bearer $token', 
        },);
      return LandMarkResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
