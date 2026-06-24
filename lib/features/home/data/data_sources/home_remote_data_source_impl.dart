import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<LandMarkResponse> getHomeData() async {
    try {
      final response = await apiService.get(ApiConstants.home);
      return LandMarkResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LandMarkResponse> getHomeDataByCategory({
    required int categoryId,
  }) async {
    try {
      final response =await apiService.get(
        ApiConstants.category,
        queryParameters: {'category_id': categoryId},
      );
   return LandMarkResponse.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
