import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/routes/app_routes.dart';

import 'package:syria_glow/features/explore/presentation/widgets/events_list_item.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.events});
  final List<Landmark> events;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220.h, 
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventListItem(
              landmark: events[index],
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.homeDetailsView,
                  arguments: events[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}