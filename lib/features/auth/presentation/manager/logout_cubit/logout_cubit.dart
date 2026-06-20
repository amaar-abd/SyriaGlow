import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/features/auth/domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());

  final LogoutUseCase logoutUseCase;

  Future<void> logout() async {
    emit(LogoutLoading());

    final String token =await sl<SecureStorageService>().read(AppConstants.authToken)??'' ;

  final result=  await logoutUseCase(userToken: token);


  result.fold(
      (failure) => emit(LogoutError(message: failure.message)),
      (successMessage) => emit(LogoutSuccess(message: successMessage)),
    );
  }
}
