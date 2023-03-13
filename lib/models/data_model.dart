import 'dart:convert';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    this.images,
    this.status,
  });

  Images? images;
  bool? status;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        images: Images.fromJson(json["images"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "images": images!.toJson(),
        "status": status,
      };
}

class Images {
  Images({
    this.created,
    this.data,
  });

  int? created;
  List<Datum>? data;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        created: json["created"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created": created,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.url,
    this.b64Json,
  });

  String? url;
  String? b64Json;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        url: json["url"],
        b64Json: json["b64_json"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "b64_json": b64Json,
      };
}
