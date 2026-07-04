import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:syria_glow/features/explore/presentation/widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl.get<ExploreCubit>(),
        child: const ExploreViewBody(),
      ),
    );
  }
}
