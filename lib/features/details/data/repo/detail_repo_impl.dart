import 'package:coffe_shop_app/features/home/data/models/coffe_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'detail_repo.dart';

class DetailRepoImpl extends DetailRepo {
final Dio dio;

  DetailRepoImpl({required this.dio});
  @override
  Future<Either<String, List<CoffeModel>>> getCoffeItem({required int coffeeId})async {
    
  String baseUrl = 'https://fake-coffee-api.vercel.app/api/$coffeeId';

  try {
    Response response = await dio.get(baseUrl);

    List<CoffeModel> coffeItem = [];

    for (var coffee in response.data) {
      coffeItem.add(CoffeModel.fromJson(coffee));
    }

    return right(coffeItem);
  } on DioException catch (e) {
    final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
    return left(errorMessage);
  } catch(e) {
    return left('oops there was an error, try later');
  }
  }


  

  
}