import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio ;

  ApiServices({required this.dio});

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    return await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
  }
}
