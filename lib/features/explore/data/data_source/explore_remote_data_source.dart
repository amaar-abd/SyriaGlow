import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class ExploreRemoteDataSource {
  Future<LandMarkResponse> searchByNmae({required String query});
  Future<LandMarkResponse> getEvents();
}
