import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/auth/domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());

  final LogoutUseCase logoutUseCase;

  Future<void> logout() async {
    await logoutUseCase();
  }
}
