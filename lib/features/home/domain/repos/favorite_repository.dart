import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, String>> addFavoriteItem({required String landmarkId});
  Future<Either<Failure, String>> deleteFavoriteItem({required String landmarkId});
  Future<Either<Failure, List<Landmark>>> getFavoriteItems();
}
