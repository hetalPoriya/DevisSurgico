// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

CollectionModel collectionModelFromJson(String str) =>
    CollectionModel.fromJson(json.decode(str));

String collectionModelToJson(CollectionModel data) =>
    json.encode(data.toJson());

class CollectionModel {
  CollectionModel({
    this.red,
    this.yellow,
    this.blue,
    this.white,
  });

  Blue? red;
  Blue? yellow;
  Blue? blue;
  Blue? white;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        red: json["red"] == null ? null : Blue.fromJson(json["red"]),
        yellow: json["yellow"] == null ? null : Blue.fromJson(json["yellow"]),
        blue: json["blue"] == null ? null : Blue.fromJson(json["blue"]),
        white: json["white"] == null ? null : Blue.fromJson(json["white"]),
      );

  Map<String, dynamic> toJson() => {
        "red": red == null ? null : red?.toJson(),
        "yellow": yellow == null ? null : yellow?.toJson(),
        "blue": blue == null ? null : blue?.toJson(),
        "white": white == null ? null : white?.toJson(),
      };
}

class Blue {
  Blue({
    this.bag,
    this.weight,
  });

  String? bag;
  String? weight;

  factory Blue.fromJson(Map<String, dynamic> json) => Blue(
        bag: json["bag"] == null ? null : json["bag"],
        weight: json["weight"] == null ? null : json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "bag": bag == null ? null : bag,
        "weight": weight == null ? null : weight,
      };
}
