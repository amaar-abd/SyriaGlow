import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/repos/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.homeRemoteDataSource});
  final HomeRemoteDataSource homeRemoteDataSource;

  @override
  Future<Either<Failure, List<Landmark>>> getHomeData() async {
    try {
      final data = await homeRemoteDataSource.getHomeData();
      return right(data.landmarks);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
  
  @override
  Future<Either<Failure, List<Landmark>>> getHomeDataByCategory({required int categoryId})async {
    try {
      final data = await homeRemoteDataSource.getHomeDataByCategory(categoryId: categoryId);
      return right(data.landmarks);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
