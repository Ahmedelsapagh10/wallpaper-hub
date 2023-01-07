import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pexels/controller/state.dart';
import 'package:pexels/models/trending_model.dart';

import '../Provider/repository.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final ImagesRepositoy IR;
  ImagesCubit(
    this.IR,
  ) : super(initState()) {}

  int page = 1;
  navigateToNextPage() {
    // if (page == 1) {
    page++;
    print(page);
    getAllImages();
    emit(nextPageState());
  }

  navigateToPrePage() {
    if (page <= 1) {
      page = 1;
      print(page);
      getAllImages();
      emit(prePageState());
    } else {
      page--;
      print(page);
      getAllImages();
      emit(prePageState());
    }
  }

  List<TrendingModel> images = [];
  List<TrendingModel> getAllImages() {
    IR.getImages(page: page).then((images) {
      this.images = images;
      emit(LoadingState(images));
    });
    return images;
  }
}
