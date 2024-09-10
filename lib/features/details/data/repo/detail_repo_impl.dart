import 'dart:developer';

import 'package:coffee_corner/features/home/data/models/coffe_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'detail_repo.dart';

class DetailRepoImpl extends DetailRepo {
  final Dio dio;

  DetailRepoImpl({required this.dio});
  @override
  Future<Either<String, CoffeModel>> getCoffeItem(
      {required int coffeeId}) async {
    String baseUrl = 'https://fake-coffee-api.vercel.app/api/$coffeeId';

    try {
      Response response = await dio.get(baseUrl);

      log(response.data.toString());
      List<CoffeModel> coffeItem = [];
      for (var coffe in response.data) {
        coffeItem.add(CoffeModel.fromJson(coffe));
      }

      return right(coffeItem[0]);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      return left(errorMessage);
    } catch (e) {
      return left('oops there was an error, try later');
    }
  }
}
