import 'package:pexels/Provider/search/webservicessearch.dart';
import 'package:pexels/models/trending_model.dart';

class ImagesSearchRepositoy {
  final WebServicesSearch webServicesSearch;
  ImagesSearchRepositoy({
    required this.webServicesSearch,
  });

  Future<List<TrendingModel>> getImages(
      {required String searchQuery, int page = 1}) async {
    final Images = await webServicesSearch.getAllImagesBySearch(
        searchQuery: searchQuery, page: page);
    print('images: ');
    print(Images);
    return Images.map((e) => TrendingModel.fromMap(e)).toList();
  }
}
