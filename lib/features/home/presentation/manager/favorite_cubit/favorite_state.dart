part of 'favorite_cubit.dart';

 class FavoriteState   {}

final class FavoriteInitial extends FavoriteState {}

class GetFavoritesLoading extends FavoriteState {}
class GetFavoritesSuccess extends FavoriteState {
  final List<Landmark> favorites;
   GetFavoritesSuccess(this.favorites);
}
class GetFavoritesFailure extends FavoriteState {
  final String errMessage;
   GetFavoritesFailure(this.errMessage);
}


class UpdateFavoriteLoading extends FavoriteState {
  final String landmarkId;
   UpdateFavoriteLoading(this.landmarkId);
}
class UpdateFavoriteSuccess extends FavoriteState {
  final String message;
   UpdateFavoriteSuccess(this.message);
}
class UpdateFavoriteFailure extends FavoriteState {
  final String errMessage;
   UpdateFavoriteFailure(this.errMessage);
}