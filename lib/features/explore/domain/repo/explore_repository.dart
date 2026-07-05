import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

abstract class ExploreRepository {
   Future<Either<Failure,List<Landmark>>> searchByNmae({required String query});
   Future<Either<Failure,List<Landmark>>> getEvents();
}