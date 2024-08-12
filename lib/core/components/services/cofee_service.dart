import 'dart:developer';
import 'package:coffe_shop_app/core/components/models/coffe_model.dart';
import 'package:dio/dio.dart';

class CoffeService {

  final Dio dio;
  final String baseUrl = 'https://fake-coffee-api.vercel.app/api/';

  CoffeService(this.dio);

  Future<List<CoffeModel>> getAllCoffe () async{
    try {
      Response response = await 
    dio.get(baseUrl);

    List<CoffeModel> coffeProduct = [];

    for (var coffe in response.data) {
      coffeProduct.add(CoffeModel.fromJson(coffe));
    }

    return coffeProduct;
    }on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errorMessage);
    }catch(e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }

  }

  
}