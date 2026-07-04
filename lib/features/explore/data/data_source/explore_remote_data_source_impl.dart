import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/features/explore/data/data_source/explore_remote_data_source.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  ExploreRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<LandMarkResponse> searchByNmae({required String query}) async {
    try {
      final response = await apiService.get(
        ApiConstants.search,
        queryParameters: {'keyword': query},
      );
      return LandMarkResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
