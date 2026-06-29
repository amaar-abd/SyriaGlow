import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

sealed class UserLocationState {}

final class UserLocationInitial extends UserLocationState {}

final class UserLocationLoading extends UserLocationState {}

final class UserLocationSuccess extends UserLocationState {
  final String address;
  final Position position;
  final List<LatLng> routePoints;
  final String distance;
  final String duration;
  final bool isRouteLoading;
  UserLocationSuccess({
    this.routePoints = const [],
    this.distance = '',
    this.duration = '',
    this.isRouteLoading = false,
    required this.address,
    required this.position,
  });
  UserLocationSuccess copyWith({
    String? address,
    Position? position,
    List<LatLng>? routePoints,
    String? distance,
    String? duration,
    bool? isRouteLoading,
  }) {
    return UserLocationSuccess(
      address: address ?? this.address,
      position: position ?? this.position,
      routePoints: routePoints ?? this.routePoints,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      isRouteLoading: isRouteLoading ?? this.isRouteLoading,
    );
  }
}

final class UserLocationFailure extends UserLocationState {
  final String errorMessage;

  UserLocationFailure({required this.errorMessage});
}
