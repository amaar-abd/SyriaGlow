part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  HomeFailure({required this.message});
  final String message;
}

final class HomeSuccess extends HomeState {
  HomeSuccess({required this.landmarks});
  final List<Landmark> landmarks;

}
