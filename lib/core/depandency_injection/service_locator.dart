import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/core/networking/dio_factory.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:syria_glow/features/auth/data/repos/auth_repository_impl.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';
import 'package:syria_glow/features/auth/domain/user_cases/register_use_case.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  sl.registerLazySingleton<Dio>(() => sl.get<DioFactory>().getDio());
  sl.registerLazySingleton<ApiService>(() => ApiService(dio: sl.get<Dio>()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: sl.get<ApiService>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiService: sl.get<ApiService>(),
      ),
    ),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: sl<AuthRepository>()),
  );
}
