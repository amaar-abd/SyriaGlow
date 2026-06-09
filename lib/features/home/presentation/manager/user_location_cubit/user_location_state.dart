sealed class UserLocationState {}

final class UserLocationInitial extends UserLocationState {}

final class UserLocationLoading extends UserLocationState {}

final class UserLocationSuccess extends UserLocationState {
  final String address;

  UserLocationSuccess({required this.address});
}

final class UserLocationFailure extends UserLocationState {
  final String errorMessage;

  UserLocationFailure({required this.errorMessage});
}
