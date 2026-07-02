import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_state.dart';
import 'package:syria_glow/features/home/presentation/widgets/map_widgets/map_detailes_card.dart';

class MapLocationViewBody extends StatefulWidget {
  const MapLocationViewBody({super.key, required this.landmark});
  final Landmark landmark;
  @override
  State<MapLocationViewBody> createState() => _MapLocationViewBodyState();
}

class _MapLocationViewBodyState extends State<MapLocationViewBody> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
    final locationState = context.read<UserLocationCubit>().state;
    if (locationState is UserLocationSuccess) {
      context.read<UserLocationCubit>().getDirections(
        origin: LatLng(
          locationState.position.latitude,
          locationState.position.longitude,
        ),
        destination: LatLng(widget.landmark.lat, widget.landmark.lng),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final LatLngBounds syriaBounds = LatLngBounds(
      southwest: const LatLng(32.3112, 35.6277),
      northeast: const LatLng(37.3189, 42.3739),
    );
    double destinationLat = widget.landmark.lat;
    double destinationLng = widget.landmark.lng;

    final CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(destinationLat, destinationLng),
      zoom: 14.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.landmark.nameAr,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.backgroundLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<UserLocationCubit, UserLocationState>(
        builder: (context, state) {
          double userLat = 33.5100;
          double userLng = 36.2800;
          List<LatLng> polylinePoints = [];
          String? distance;
          String? duration;
          bool isLoading = false;
          if (state is UserLocationSuccess) {
            userLat = state.position.latitude;
            userLng = state.position.longitude;
            polylinePoints = state.routePoints;
            distance = state.distance;
            duration = state.duration;
            isLoading = state.isRouteLoading;
          }
          return Stack(
            children: [
              GoogleMap(
                cameraTargetBounds: CameraTargetBounds(syriaBounds),
                zoomControlsEnabled: false,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
                markers: {
                  Marker(
                    markerId: MarkerId('user_location'),
                    position: LatLng(userLat, userLng),
                    infoWindow: InfoWindow(title: 'موقعي الحالي'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure,
                    ),
                  ),
                  Marker(
                    markerId: MarkerId('destination_location'),
                    position: LatLng(destinationLat, destinationLng),
                    infoWindow: InfoWindow(title: widget.landmark.nameAr),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                  ),
                },
                polylines: {
                  Polyline(
                    polylineId: PolylineId('0'),
                    color: AppColors.primaryGreen,
                    points: polylinePoints,
                    width: 4,
                    endCap: Cap.roundCap,
                  ),
                },
              ),     
              if (distance != null && duration != null)
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: MapDetailesCard(
                    duration: duration,
                    distance: distance,
                  ),
                ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryGreen,
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 75.h),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryGreen,
          onPressed: () async {
            final currentState = context.read<UserLocationCubit>().state;

            double userLat = 33.5100;
            double userLng = 36.2800;

            if (currentState is UserLocationSuccess) {
              userLat = currentState.position.latitude;
              userLng = currentState.position.longitude;
            }
            final GoogleMapController controller = await _mapController.future;
            LatLngBounds bounds = LatLngBounds(
              southwest: LatLng(
                min(userLat, destinationLat),
                min(userLng, destinationLng),
              ),
              northeast: LatLng(
                max(userLat, destinationLat),
                max(userLng, destinationLng),
              ),
            );

            controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
          },
          child: const Icon(Icons.zoom_out_map_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
