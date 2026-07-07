import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/domain/repos/favorite_repository.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepository) : super(FavoriteInitial());

  final FavoriteRepository favoriteRepository;
  final Map<String, bool> favoritesMap = {};

  Future<void> fetchFavorites() async {
    emit(GetFavoritesLoading());
    final result = await favoriteRepository.getFavoriteItems();

    result.fold((failure) => emit(GetFavoritesFailure(failure.message)), (
      landmarks,
    ) {
      for (var landmark in landmarks) {
        favoritesMap[landmark.id.toString()] = true;
      }
      emit(GetFavoritesSuccess(landmarks));
    });
  }

  Future<void> toggleFavorite({required String landmarkId}) async {
    final isFfavorite = favoritesMap[landmarkId] ?? false;
    emit(UpdateFavoriteLoading(landmarkId));
    if (isFfavorite) {
      final result = await favoriteRepository.deleteFavoriteItem(
        landmarkId: landmarkId,
      );
      result.fold((failure) => emit(UpdateFavoriteFailure(failure.message)), (
        message,
      ) {
        favoritesMap[landmarkId] = false;
        fetchFavorites();
        emit(UpdateFavoriteSuccess(message));
      });
    }else{
      final result = await favoriteRepository.addFavoriteItem(
        landmarkId: landmarkId,
      );
      result.fold((failure) => emit(UpdateFavoriteFailure(failure.message)), (
        message,
      ) {
        favoritesMap[landmarkId] = true;
        fetchFavorites();
        emit(UpdateFavoriteSuccess(message));
      });
    }
  }

  bool isLandmarkFavorite(String landmarkId) {
    return favoritesMap[landmarkId] ?? false;
  }
}
