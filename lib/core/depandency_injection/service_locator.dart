import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syria_glow/core/manager/routing_cubit/routing_cubit.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/core/networking/dio_factory.dart';
import 'package:syria_glow/core/services/notification_service.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/core/services/shared_preferences_service.dart';
import 'package:syria_glow/features/ai_chat/data/datasource/ai_remote_data_source.dart';
import 'package:syria_glow/features/ai_chat/data/repositories/chat_repository_impl.dart';
import 'package:syria_glow/features/ai_chat/domain/repositories/chat_repository.dart';
import 'package:syria_glow/features/ai_chat/presentation/manager/ai_chat/ai_chat_cubit.dart';
import 'package:syria_glow/features/assistant/data/datasources/weather_remote_data_source.dart';
import 'package:syria_glow/features/assistant/data/repositories/weather_repository_impl.dart';
import 'package:syria_glow/features/assistant/domain/repositories/weather_repository.dart';
import 'package:syria_glow/features/assistant/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:syria_glow/features/auth/data/repos/auth_repository_impl.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';
import 'package:syria_glow/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/register_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:syria_glow/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:syria_glow/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:syria_glow/features/explore/data/data_source/explore_remote_data_source.dart';
import 'package:syria_glow/features/explore/data/data_source/explore_remote_data_source_impl.dart';
import 'package:syria_glow/features/explore/data/repo/explore_repository_impl.dart';
import 'package:syria_glow/features/explore/domain/repo/explore_repository.dart';
import 'package:syria_glow/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:syria_glow/features/home/data/data_sources/favorite_remote_data_source.dart';
import 'package:syria_glow/features/home/data/data_sources/favorite_remote_data_source_impl.dart';
import 'package:syria_glow/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:syria_glow/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:syria_glow/features/home/data/data_sources/location_local_data_source.dart';
import 'package:syria_glow/features/home/data/repos/favorite_repository_impl.dart';
import 'package:syria_glow/features/home/data/repos/home_repository_impl.dart';
import 'package:syria_glow/features/home/domain/repos/favorite_repository.dart';
import 'package:syria_glow/features/home/domain/repos/home_repository.dart';
import 'package:syria_glow/features/home/domain/use_cases/get_home_data_by_category_use_case.dart';
import 'package:syria_glow/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:syria_glow/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/home_category_cubit/category_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:syria_glow/features/notifications/data/repo/notifications_repository_impl.dart';
import 'package:syria_glow/features/notifications/domain/repos/notifications_repository.dart';
import 'package:syria_glow/features/notifications/presentation/manager/notification_cubit/notifications_cubit.dart';
import 'package:syria_glow/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:syria_glow/features/profile/data/repos/profile_repository_impl.dart';
import 'package:syria_glow/features/profile/domain/repos/profile_repository.dart';
import 'package:syria_glow/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(sharedPrefs),
  );

  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(const FlutterSecureStorage()),
  );

  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  sl.registerLazySingleton<Dio>(() => sl.get<DioFactory>().getDio());
  sl.registerLazySingleton<ApiService>(() => ApiService(dio: sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: sl()),
  );

  sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<VerifyResetCodeUseCase>(
    () => VerifyResetCodeUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: sl()),
  );

  sl.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(sl(), sl(), sl()),
  );

  sl.registerLazySingleton<RoutingCubit>(() => RoutingCubit());

  sl.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<UserLocationCubit>(() => UserLocationCubit(sl()));

  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepository: sl()),
  );

  sl.registerFactory<LogoutCubit>(() => LogoutCubit(sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<GetHomeDataUseCase>(
    () => GetHomeDataUseCase(homeRepository: sl()),
  );
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));

  sl.registerLazySingleton<GetHomeDataByCategoryUseCase>(
    () => GetHomeDataByCategoryUseCase(homeRepository: sl()),
  );

  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl()));

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<NotificationService>(
    () => NotificationService(firestore: sl()),
  );
  sl.registerFactory<NotificationsCubit>(() => NotificationsCubit(sl()));

  sl.registerLazySingleton<ExploreRemoteDataSource>(
    () => ExploreRemoteDataSourceImpl(apiService: sl()),
  );
  sl.registerLazySingleton<ExploreRepository>(
    () => ExploreRepositoryImpl(exploreRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<ExploreCubit>(() => ExploreCubit(sl()));

  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSourceImpl(apiService: sl()),
  );
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(favoriteRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiService: sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(sl()));

  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(dio: Dio()),
  );
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: sl()),
  );
  sl.registerFactory<WeatherCubit>(() => WeatherCubit(sl()));

  sl.registerLazySingleton<AiRemoteDataSource>(() => AiRemoteDataSource());
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerFactory<AiChatCubit>(() => AiChatCubit(sl()));
}
