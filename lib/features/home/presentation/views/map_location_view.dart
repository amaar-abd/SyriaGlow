import 'package:flutter/material.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/widgets/map_widgets/map_location_view_body.dart';

class MapLocationView extends StatelessWidget {
  const MapLocationView({super.key, required this.landmark});
  final Landmark landmark;
  @override
  Widget build(BuildContext context) {
    return MapLocationViewBody(landmark: landmark);
  }
}
