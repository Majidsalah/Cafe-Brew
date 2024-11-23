part of 'favorite_cubit.dart';

class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteEmpty extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<CoffeeModel> favorites;

  FavoriteSuccess({required this.favorites});
}

final class FavoriteFailed extends FavoriteState {
  final String errMessage;

  FavoriteFailed({required this.errMessage});
}
