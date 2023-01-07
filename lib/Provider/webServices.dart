import 'package:dio/dio.dart';
import 'package:pexels/constant.dart';

class WebServices {
  late Dio dio;
  WebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: BaseUrl,
        receiveTimeout: 20000,
        connectTimeout: 20000,
        receiveDataWhenStatusError: true,
        headers: {'Authorization': Apikey});
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllImages({int page = 1}) async {
    try {
      Response response = await dio.get('curated/?page=${page}');
      // print(response.data);
      return response.data['photos'];
    } catch (e) {
      print('error : ${e.toString()}');
      return [];
    }
  }
}
