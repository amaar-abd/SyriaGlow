import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syria_glow/features/home/data/data_sources/location_local_data_source.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_state.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  final LocationLocalDataSource localDataSource;

  StreamSubscription<ServiceStatus>? gpsServiceSubscription;

  UserLocationCubit(this.localDataSource) : super(UserLocationInitial()) {
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

      emit(UserLocationSuccess(address: fullAddress));
    } catch (e) {
      emit(UserLocationFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
