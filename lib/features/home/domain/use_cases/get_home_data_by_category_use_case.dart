import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/repos/home_repository.dart';

class GetHomeDataByCategoryUseCase {
  GetHomeDataByCategoryUseCase({required this.homeRepository});
  final HomeRepository homeRepository;

  Future<Either<Failure, List<Landmark>>> call({
    required int categoryId,
  }) async {
    return await homeRepository.getHomeDataByCategory(categoryId: categoryId);
  }
}
