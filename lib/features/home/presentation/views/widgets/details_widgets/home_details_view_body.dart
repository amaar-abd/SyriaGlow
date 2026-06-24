import 'package:flutter/material.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/details_widgets/details_image_slider.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/details_widgets/details_info_section.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key, required this.landmark});
  final Landmark landmark;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: DetailsImageSlider(landmark: landmark)),

        SliverToBoxAdapter(child: DetailsInfoSection(landmark: landmark)),
      ],
    );
  }
}
