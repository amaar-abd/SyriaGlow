part of 'category_cubit.dart';


sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure({required this.message});
}

final class CategorySuccess extends CategoryState {
  final List<Landmark> landmarks;
  CategorySuccess({required this.landmarks});
}
