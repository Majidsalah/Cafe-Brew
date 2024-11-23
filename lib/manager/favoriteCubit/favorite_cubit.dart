import 'package:bloc/bloc.dart';
import 'package:caffino/data/coffeeModel/coffee_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<CoffeeModel> favorites = [];
  isFavoriteEmpty() {
    if (favorites.isEmpty) {
      return emit(FavoriteEmpty());
    }
  }

  void addToFavorite(CoffeeModel coffee) {
    if (!favorites.contains(coffee)) {
      favorites.add(coffee);
    } else {
      favorites.remove(coffee);
    }
    emit(FavoriteSuccess(favorites: favorites));
  }

  bool isFavorite(CoffeeModel coffee) {
    return favorites.contains(coffee);
  }
  // addToFavorite(CoffeeModel selectedCoffee) {
  //   if (!favorites.contains(selectedCoffee)) {
  //     return favorites.add(selectedCoffee);
  //   }
  //   emit(FavoriteSuccess(favorites: favorites));
  // }
}
