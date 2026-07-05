import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/explore/data/data_source/explore_remote_data_source.dart';
import 'package:syria_glow/features/explore/domain/repo/explore_repository.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  ExploreRepositoryImpl({required this.exploreRemoteDataSource});
  final ExploreRemoteDataSource exploreRemoteDataSource;

  @override
  Future<Either<Failure, List<Landmark>>> searchByNmae({
    required String query,
  }) async {
    try {
      final response = await exploreRemoteDataSource.searchByNmae(query: query);
      return right(response.landmarks);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<Landmark>>> getEvents() async {
    try {
      final response = await exploreRemoteDataSource.getEvents();
      return right(response.landmarks);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
