import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/data_sources/favorite_remote_data_source.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/repos/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl({required this.favoriteRemoteDataSource});
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  @override
  Future<Either<Failure, String>> addFavoriteItem({
    required String landmarkId,
  }) async {
    try {
      final response = await favoriteRemoteDataSource.addFavoriteItem(
        landmarkId: landmarkId,
      );
      return right(response);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavoriteItem({
    required String landmarkId,
  }) async {
    try {
      final response = await favoriteRemoteDataSource.deleteFavoriteItem(
        landmarkId: landmarkId,
      );
      return right(response);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<Landmark>>> getFavoriteItems() async {
    try {
      final response = await favoriteRemoteDataSource.getFavoriteItems();
      return right(response.landmarks);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
