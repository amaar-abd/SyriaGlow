import 'package:flutter/material.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/explore/presentation/widgets/search_results_item.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key, required this.landmarks});
  final List<Landmark> landmarks;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: landmarks.length,

      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchResultsItem(
              landmark: landmarks[index],
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.homeDetailsView, arguments: landmarks[index]);
              },
            ),
          
          ],
        );
      },
    );
  }
}
