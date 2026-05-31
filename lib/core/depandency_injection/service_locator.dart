import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/core/networking/dio_factory.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:syria_glow/features/auth/data/repos/auth_repository_impl.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';
import 'package:syria_glow/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/register_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:syria_glow/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
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
}
