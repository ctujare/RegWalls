class WallpaperModel {

  String? photographer;
  String? photographer_url;
  int? photographer_id;
  SrcModel? src;

  WallpaperModel({
    this.src,
    this.photographer_url,
    this.photographer_id,
    this.photographer});

  factory WallpaperModel.fromMap(Map<String, dynamic>jsonData) {
    return WallpaperModel(
      src: jsonData["src"],
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"]
    );
  }

}


class SrcModel {

  String original;
  String small;
  String portrait;

  SrcModel({required this.portrait, required this.original, required this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"]
    );
  }
}