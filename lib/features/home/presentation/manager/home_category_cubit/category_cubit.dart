import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/use_cases/get_home_data_by_category_use_case.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.useCase) : super(CategoryInitial());

  final GetHomeDataByCategoryUseCase useCase;

  Future<void> getCategory({required int id}) async {
    emit(CategoryLoading());
    final result = await useCase(categoryId: id);
    result.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (data) => emit(CategorySuccess(landmarks: data)),
    );
  }
}
