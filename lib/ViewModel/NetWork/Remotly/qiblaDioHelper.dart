import 'package:dio/dio.dart';
import 'package:muslim/constant/baseUrl.dart';

class qiblaNetWork {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(baseUrl: qibla_and_adhan_baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getQiblaData(
      {required String url, Map<String, dynamic>? query}) async {
    try {
      final Response response = await dio!.get(
        url,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
