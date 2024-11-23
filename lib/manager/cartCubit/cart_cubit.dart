import 'package:bloc/bloc.dart';
import 'package:caffino/data/coffeeModel/coffee_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CoffeeModel> cartList = [];

  isCartEmpty() {
    if (cartList.isEmpty) {
      emit(CoffeeCartEmpty());
    }
  }

  addToCart(CoffeeModel selectedCoffee) {
    emit(CoffeeCartLoading());
    if (!cartList.contains(selectedCoffee)) {
      cartList.add(selectedCoffee);
    }
    emit(CoffeeCartSuccess(cart: cartList));
  }

  double totalCharge() {
    double total = 0;
    for (CoffeeModel item in cartList) {
      total += (item.price ?? 0) * item.quantity;
    }
    return total;
  }

  void increaseQuantity(CoffeeModel coffee) {
    coffee.quantity++;
    emit(CoffeeCartSuccess(cart: cartList)); 
  }

  void decreaseQuantity(CoffeeModel coffee) {
    if (coffee.quantity > 1) {
      coffee.quantity--;
      emit(CoffeeCartSuccess(cart: cartList));
    }
  }
}
