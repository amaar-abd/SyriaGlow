import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/domain/use_cases/register_use_case.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  Future<void> registerAccount({
    required RegisterRequest registerRequest,
  }) async {
    emit(RegisterLoading());

    final result = await registerUseCase(registerRequest: registerRequest);

    result.fold(
      (failure) => emit(RegisterError(error: failure.message)),
      (authResponse) => emit(RegisterSuccess(authResponse: authResponse)),
    );
  }
}
