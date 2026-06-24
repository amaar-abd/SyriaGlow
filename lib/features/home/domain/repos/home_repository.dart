import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Landmark>>> getHomeData();
  
  Future<Either<Failure, List<Landmark>>> getHomeDataByCategory({
    required int categoryId,
  });
}
