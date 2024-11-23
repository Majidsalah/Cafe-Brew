part of 'coffee_cubit_cubit.dart';

class CoffeeCubitState {}

final class CoffeeCubitInitial extends CoffeeCubitState {}

final class CoffeeCubitLoading extends CoffeeCubitState {}


final class CoffeeCubitSuccess extends CoffeeCubitState {
  final List<CoffeeModel> cups;
  //  List<CoffeeModel> ? cart;

  CoffeeCubitSuccess({
    required this.cups,
  });
}

final class CoffeeCubitFailed extends CoffeeCubitState {
  final String errMessage;

  CoffeeCubitFailed({required this.errMessage});
}
