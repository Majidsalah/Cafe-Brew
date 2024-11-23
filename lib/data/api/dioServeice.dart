import 'package:caffino/data/api/endPoint.dart';
import 'package:caffino/data/api/errors.dart';
import 'package:caffino/data/coffeeModel/coffee_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio();

  Future<Either<Failure, List<CoffeeModel>>> getCoffeeData() async {
    try {
      var response = await dio.get(endPoint);

      List<dynamic> coffeeCups = response.data;
      List<CoffeeModel> cups = [];

      for (var cup in coffeeCups) {
        cups.add(CoffeeModel.fromJson(cup));
      }
      return right(cups);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure(e.toString()));
    }
  }
}
