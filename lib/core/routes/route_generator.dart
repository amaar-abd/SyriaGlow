import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:syria_glow/features/auth/presentation/views/forgote_password/forgote_password_view.dart';
import 'package:syria_glow/features/auth/presentation/views/forgote_password/otp_verification_view.dart';
import 'package:syria_glow/features/auth/presentation/views/forgote_password/reset_password_view.dart';
import 'package:syria_glow/features/auth/presentation/views/forgote_password/success_reset_password_viw.dart';
import 'package:syria_glow/features/auth/presentation/views/login_view.dart';
import 'package:syria_glow/features/auth/presentation/views/signup_view.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/home/presentation/views/all_categories_view.dart';
import 'package:syria_glow/features/home/presentation/views/home_details_view.dart';
import 'package:syria_glow/features/home/presentation/views/category_view.dart';
import 'package:syria_glow/features/home/presentation/views/map_location_view.dart';
import 'package:syria_glow/features/notifications/presentation/views/notifications_view.dart';
import 'package:syria_glow/features/main_layout/presentation/views/main_layout_view.dart';
import 'package:syria_glow/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:syria_glow/features/profile/presentation/views/favorite_view.dart';
import 'package:syria_glow/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static ForgotPasswordCubit? _forgotPasswordCubit;
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case AppRoutes.mainLayoutView:
        return MaterialPageRoute(builder: (context) => const MainLayoutView());

      case AppRoutes.forgotePasswordView:
        _forgotPasswordCubit = sl<ForgotPasswordCubit>();
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _forgotPasswordCubit!,
            child: const ForgotePasswordView(),
          ),
        );
      case AppRoutes.otpVerificationView:
        final email = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _forgotPasswordCubit!,
            child: OtpVerificationView(email: email as String),
          ),
        );
      case AppRoutes.resetPasswordView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _forgotPasswordCubit!,
            child: const ResetPasswordView(),
          ),
        );
      case AppRoutes.successResetPasswordViw:
        return MaterialPageRoute(
          builder: (context) => const SuccessResetPasswordViw(),
        );
      case AppRoutes.homeDetailsView:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: sl.get<FavoriteCubit>(),
            child: HomeDetailsView(landmark: args as Landmark)),
        );
      case AppRoutes.categoryView:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => CategoryView(
            categoryId: args['id'] ?? 1,
            categoryTitle: args['title'] ?? '',
          ),
        );
      case AppRoutes.mapLocationView:
        final args = settings.arguments as Landmark;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: sl.get<UserLocationCubit>(),
            child: MapLocationView(landmark: args),
          ),
        );
      case AppRoutes.notificationsView:
        return MaterialPageRoute(
          builder: (context) => const NotificationsView(),
        );
      case AppRoutes.allCategoriesView:
        return MaterialPageRoute(
          builder: (context) => const AllCategoriesView(),
        );
      case AppRoutes.favoriteView:
        return MaterialPageRoute(builder: (context) => BlocProvider.value(
          value: sl.get<FavoriteCubit>(),
          child: const FavoriteView()));

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
