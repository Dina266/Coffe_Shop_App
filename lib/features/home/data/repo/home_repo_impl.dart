import 'package:coffe_shop_app/features/home/data/models/coffe_model.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
final Dio dio;

  HomeRepoImpl({required this.dio});
  @override
  Future<Either<String, List<CoffeModel>>> getCoffeList()async {
     
  const String baseUrl = 'https://fake-coffee-api.vercel.app/api/';

  try {
    Response response = await dio.get(baseUrl);

    List<CoffeModel> coffeProduct = [];

    for (var coffee in response.data) {
      coffeProduct.add(CoffeModel.fromJson(coffee));
    }

    return right(coffeProduct);
  } on DioException catch (e) {
    final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
    return left(errorMessage);
  } catch(e) {
    return left('oops there was an error, try later');
  }
  }


  

  
}