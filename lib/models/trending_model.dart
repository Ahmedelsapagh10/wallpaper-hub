class TrendingModel {
  late String photographer;
  late String photographer_url;
  late int photographer_id;
  late SrcModel src;
  TrendingModel({
    required this.photographer,
    required this.photographer_url,
    required this.photographer_id,
    required this.src,
  });
  factory TrendingModel.fromMap(Map<String, dynamic> json) {
    return TrendingModel(
        photographer: json["photographer"],
        photographer_url: json["photographer_url"],
        photographer_id: json["photographer_id"],
        src: SrcModel.fromMap(json["src"]));
  }
}

class SrcModel {
  late String original;
  late String small;
  late String portrait;
  SrcModel({
    required this.original,
    required this.small,
    required this.portrait,
  });
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData['original'],
        small: jsonData['small'],
        portrait: jsonData['portrait']);
  }
}
