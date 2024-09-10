import 'package:coffee_corner/features/home/data/models/coffe_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<String, List<CoffeModel>>> getCoffeList();
}
