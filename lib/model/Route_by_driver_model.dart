// /// id : 1
// /// name : "Route 1"
// /// hospital_id : "G797,G795,G794"
// /// status : 1
// /// created_at : "2022-08-04T11:56:01.000000Z"
// /// updated_at : "2022-08-04T11:56:34.000000Z"
//
// class RouteByDriverModel {
//   RouteByDriverModel({
//     num? id,
//     String? name,
//     String? hospitalId,
//     num? status,
//     String? createdAt,
//     String? updatedAt,
//   }) {
//     _id = id;
//     _name = name;
//     _hospitalId = hospitalId;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }
//
//   RouteByDriverModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _hospitalId = json['hospital_id'];
//     _status = json['status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//
//   num? _id;
//   String? _name;
//   String? _hospitalId;
//   num? _status;
//   String? _createdAt;
//   String? _updatedAt;
//
//   RouteByDriverModel copyWith({
//     num? id,
//     String? name,
//     String? hospitalId,
//     num? status,
//     String? createdAt,
//     String? updatedAt,
//   }) =>
//       RouteByDriverModel(
//         id: id ?? _id,
//         name: name ?? _name,
//         hospitalId: hospitalId ?? _hospitalId,
//         status: status ?? _status,
//         createdAt: createdAt ?? _createdAt,
//         updatedAt: updatedAt ?? _updatedAt,
//       );
//
//   num? get id => _id;
//
//   String? get name => _name;
//
//   String? get hospitalId => _hospitalId;
//
//   num? get status => _status;
//
//   String? get createdAt => _createdAt;
//
//   String? get updatedAt => _updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['hospital_id'] = _hospitalId;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
// }
// To parse this JSON data, do
//
//     final routeByDriverModel = routeByDriverModelFromMap(jsonString);

import 'dart:convert';

RouteByDriverModel routeByDriverModelFromMap(String str) =>
    RouteByDriverModel.fromMap(json.decode(str));

String routeByDriverModelToMap(RouteByDriverModel data) =>
    json.encode(data.toMap());

class RouteByDriverModel {
  RouteByDriverModel({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory RouteByDriverModel.fromMap(Map<String, dynamic> json) =>
      RouteByDriverModel(
        status: json["Status"] == null ? null : json["Status"],
        data: json["Data"] == null
            ? null
            : List<Datum>.from(json["Data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Status": status == null ? null : status,
        "Data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.hospitalId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? hospitalId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        hospitalId: json["hospital_id"] == null ? null : json["hospital_id"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "hospital_id": hospitalId == null ? null : hospitalId,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
