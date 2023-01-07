import 'package:pexels/models/trending_model.dart';

abstract class ImagesState {}

class initState extends ImagesState {}

class LoadingState extends ImagesState {
  final List<TrendingModel> images;
  LoadingState(
    this.images,
  );
}

class nextPageState extends ImagesState {}

class Scroll extends ImagesState {}

class prePageState extends ImagesState {}
