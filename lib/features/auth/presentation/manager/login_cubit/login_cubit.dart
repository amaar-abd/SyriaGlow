import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/domain/user_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    final result = await loginUseCase(loginRequest: loginRequest);

    result.fold(
      (failure) => emit(LoginError(error: failure.message)),
      (authResponse) => emit(LoginSuccess(authResponse: authResponse)),
    );
  }
}
