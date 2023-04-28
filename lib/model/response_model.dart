import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  final bool unsafe;
  final List<Object> objects;

  ResponseModel({
    required this.unsafe,
    required this.objects,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    unsafe: json["unsafe"],
    objects: List<Object>.from(json["objects"].map((x) => Object.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unsafe": unsafe,
    "objects": List<dynamic>.from(objects.map((x) => x.toJson())),
  };
}

class Object {
  final List<int> box;
  final double score;
  final String label;

  Object({
    required this.box,
    required this.score,
    required this.label,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
    box: List<int>.from(json["box"].map((x) => x)),
    score: json["score"]?.toDouble(),
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "box": List<dynamic>.from(box.map((x) => x)),
    "score": score,
    "label": label,
  };
}
