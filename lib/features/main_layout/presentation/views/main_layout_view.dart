import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/home/data/data_sources/location_local_data_source.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/main_layout/presentation/widgets/main_layout_view_body.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLocationCubit(sl.get<LocationLocalDataSource>())..fetchLocation(),
      child: const MainLayoutViewBody(),
    );
  }
}
