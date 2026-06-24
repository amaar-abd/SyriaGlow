import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/use_cases/get_home_data_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getHomeDataUseCase) : super(HomeInitial());
  final GetHomeDataUseCase getHomeDataUseCase;

  Future<void> mostVisitedPlaces() async {
    emit(HomeLoading());

    final results = await getHomeDataUseCase();

    results.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (landmarks) => emit(HomeSuccess(landmarks: landmarks)),
    );
  }
}
