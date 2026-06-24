import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class HomeRemoteDataSource {
  Future<LandMarkResponse> getHomeData();
  Future<LandMarkResponse> getHomeDataByCategory({required int categoryId});
}
