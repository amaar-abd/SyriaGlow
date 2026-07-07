import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<String> addFavoriteItem({required String landmarkId});

  Future<String> deleteFavoriteItem({required String landmarkId});
  
  Future<LandMarkResponse> getFavoriteItems();
}
