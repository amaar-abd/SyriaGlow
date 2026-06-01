import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/core/services/shared_preferences_service.dart';

part 'routing_state.dart';

class RoutingCubit extends Cubit<RoutingState> {
  RoutingCubit() : super(RoutingInitial());

  void checkRouting() async {
    await Future.delayed(const Duration(seconds: 3));

    final bool isOnboardingCompleted =
        sl<SharedPreferencesService>().getBool(
          AppConstants.isOnboardingCompleted,
        ) ??
        false;
    final String? token = await sl<SecureStorageService>().read(
      AppConstants.authToken,
    );

    if (!isOnboardingCompleted) {
      emit(NavigateToOnboarding());
    } else if (token == null || token.isEmpty) {
      emit(NavigateToLogin());
    } else {
      emit(NavigateToHome());
    }
  }
}
