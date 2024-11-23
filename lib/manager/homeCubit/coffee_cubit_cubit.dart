import 'package:bloc/bloc.dart';
import 'package:caffino/data/api/dioServeice.dart';
import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:caffino/manager/cartCubit/cart_cubit.dart';

part 'coffee_cubit_state.dart';

enum CoffeeCategory { hotAndCold, hot, cold }

class CoffeeCubitCubit extends Cubit<CoffeeCubitState> {
  CoffeeCubitCubit() : super(CoffeeCubitInitial());
  DioService dio = DioService();
  List<CoffeeModel> _allCups = [];

  String _searchText = '';
  CoffeeCategory _currentCategory = CoffeeCategory.hotAndCold;
  Future<dynamic> getCoffeeCups() async {
    var data = await dio.getCoffeeData();

    data.fold(
        (failure) => emit(CoffeeCubitFailed(errMessage: failure.errorMessage)),
        (cupsData) {
      _allCups = cupsData;
      _applyHotColdFilter();
    });
  }

  void setFilter(CoffeeCategory category) {
    _currentCategory = category;
    _applyHotColdFilter();
  }

  void setSearchText(String text) {
    _searchText = text;
    _applyHotColdFilter();
  }

  void _applyHotColdFilter() {
    final filteredCups = _allCups.where((cup) {
      if (_currentCategory == CoffeeCategory.hot) {
        return cup.category!.hot == true &&
            cup.title!.toLowerCase().contains(_searchText.toLowerCase());
      }
      if (_currentCategory == CoffeeCategory.cold) {
        return cup.category!.cold == true &&
            cup.title!.toLowerCase().contains(_searchText.toLowerCase());
      }
      return cup.title!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    emit(CoffeeCubitSuccess(
      cups: filteredCups,
    ));
  }

  void addToCartItem(CoffeeModel cup, CartCubit cartCubit) {
    // Add the item to the cart
    cartCubit.addToCart(cup);

    // Remove the item from the list and emit a new state
    final updatedCups = List<CoffeeModel>.from(_allCups);
    emit(CoffeeCubitSuccess(cups: updatedCups));
  }
}
