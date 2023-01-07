import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/Provider/search/repositorySearch.dart';
import 'package:pexels/controller/SearchCubit/searchState.dart';

import 'package:pexels/models/trending_model.dart';

class ImagesSearchCubit extends Cubit<ImagesSearchState> {
  final ImagesSearchRepositoy ISR;
  ImagesSearchCubit(
    this.ISR,
  ) : super(initState()) {}

  int page = 1;
  navigateToNextPage({required String searchQuery}) {
    page++;
    print(page);
    getAllImages(searchQuery: searchQuery);
    emit(nextPageState());
  }

  navigateToPrePage({required String searchQuery}) {
    if (page <= 1) {
      page = 1;
      print(page);
      getAllImages(searchQuery: searchQuery);
      emit(nextPageState());
    } else {
      page--;
      print(page);
      getAllImages(searchQuery: searchQuery);
      emit(prePageState());
    }
  }

  List<TrendingModel> images = [];
  List<TrendingModel> getAllImages({required String searchQuery}) {
    ISR.getImages(searchQuery: searchQuery, page: page).then((images) {
      this.images = images;
      emit(LoadingState(images));
    });
    return images;
  }
}
