import 'package:coffee_corner/features/home/data/models/coffe_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailRepo {
  Future<Either<String, CoffeModel>> getCoffeItem({required int coffeeId});
}
