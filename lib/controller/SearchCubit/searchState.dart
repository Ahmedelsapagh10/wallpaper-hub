import 'package:pexels/models/trending_model.dart';

abstract class ImagesSearchState {}

class initState extends ImagesSearchState {}

class LoadingState extends ImagesSearchState {
  final List<TrendingModel> images;
  LoadingState(
    this.images,
  );
}

class nextPageState extends ImagesSearchState {}

class prePageState extends ImagesSearchState {}
