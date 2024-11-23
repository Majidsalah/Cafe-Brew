part of 'cart_cubit.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CoffeeCartLoading extends CartState {}
final class CoffeeCartEmpty extends CartState {}

final class CoffeeCartSuccess extends CartState {
  final List<CoffeeModel> cart;

  CoffeeCartSuccess({required this.cart});
}

final class CoffeeCartFailed extends CartState {
  final String errMessage;

  CoffeeCartFailed({required this.errMessage});
}
