import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/features/home/data/data_sources/location_local_data_source.dart';

import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_state.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  final LocationLocalDataSource localDataSource;

  StreamSubscription<ServiceStatus>? gpsServiceSubscription;

  UserLocationCubit(this.localDataSource,)
    : super(UserLocationInitial()) {
    _monitorGPSService();
  }

  void _monitorGPSService() {
    gpsServiceSubscription = Geolocator.getServiceStatusStream().listen((
      ServiceStatus status,
    ) {
      if (status == ServiceStatus.enabled) {
        fetchLocation(languageCode: 'ar');
      }
    });
  }

  Future<void> fetchLocation({String? languageCode}) async {
    emit(UserLocationLoading());

    try {
      Position position = await localDataSource.getCurrentPosition();

      Placemark placemark = await localDataSource.getPlacemarkFromCoordinates(
        position.latitude,
        position.longitude,
        languageCode,
      );

      String fullAddress =
          "${placemark.street}, ${placemark.locality},  ${placemark.subLocality}";

      emit(UserLocationSuccess(address: fullAddress, position: position));
    } catch (e) {
      emit(UserLocationFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    if (state is UserLocationSuccess) {
      final currentState = state as UserLocationSuccess;
      emit(currentState.copyWith(isRouteLoading: true));

      final String googleApiKey = ApiConstants.googleApiKey;
      final String url =
          "https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleApiKey&language=ar";

      try {
        final Dio googleDio = Dio();
        final Response response = await googleDio.get(url);
        if (response.statusCode == 200 && response.data != null) {
          final data = response.data;
          if ((data['routes'] as List).isNotEmpty) {
            
            final routes = data['routes'][0];

            final leg = routes['legs'][0];

            final distanceStr = leg['distance']['text'];
            final durationStr = leg['duration']['text'];
            
            final String encodedPoints = routes['overview_polyline']['points'];
            PolylinePoints polylinePoints = PolylinePoints();
            List<PointLatLng> decodedPoints = polylinePoints.decodePolyline(
              encodedPoints,
            );

            List<LatLng> routeCoordinates = decodedPoints
                .map((point) => LatLng(point.latitude, point.longitude))
                .toList();

            emit(
              currentState.copyWith(
                routePoints: routeCoordinates,
                distance: distanceStr,
                duration: durationStr,
                isRouteLoading: false,
              ),
            );
          } else {
            emit(currentState.copyWith(isRouteLoading: false));
          }
        } else {
          emit(currentState.copyWith(isRouteLoading: false));
        }
      } catch (e) {
        emit(currentState.copyWith(isRouteLoading: false));
      }
    }
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
