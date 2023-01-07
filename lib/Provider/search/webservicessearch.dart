import 'package:dio/dio.dart';
import 'package:pexels/constant.dart';

class WebServicesSearch {
  late Dio dio;
  WebServicesSearch() {
    BaseOptions options = BaseOptions(
        baseUrl: searchUrl,
        receiveTimeout: 20000,
        connectTimeout: 20000,
        receiveDataWhenStatusError: true,
        headers: {'Authorization': Apikey});
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllImagesBySearch(
      {required String searchQuery, int page = 1}) async {
    try {
      Response response = await dio.get('{$searchQuery}&page=${page}');
      // print(response.data);
      return response.data['photos'];
    } catch (e) {
      print('error : ${e.toString()}');
      return [];
    }
  }
}
