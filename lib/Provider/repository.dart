import 'package:pexels/Provider/webServices.dart';
import 'package:pexels/models/trending_model.dart';

class ImagesRepositoy {
  final WebServices webServices;
  ImagesRepositoy({
    required this.webServices,
  });

  Future<List<TrendingModel>> getImages({int page = 1}) async {
    final Images = await webServices.getAllImages(page: page);
    print('images: ');
    print(Images);
    return Images.map((e) => TrendingModel.fromMap(e)).toList();
  }
}
