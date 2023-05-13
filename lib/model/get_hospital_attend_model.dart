// To parse this JSON data, do
//
//     final getHospitalAttendModel = getHospitalAttendModelFromJson(jsonString);

import 'dart:convert';

GetHospitalAttendModel getHospitalAttendModelFromJson(String str) =>
    GetHospitalAttendModel.fromJson(json.decode(str));

String getHospitalAttendModelToJson(GetHospitalAttendModel data) =>
    json.encode(data.toJson());

class GetHospitalAttendModel {
  GetHospitalAttendModel({
    this.status,
    this.data,
  });

  bool? status;
  List<GetHospitalAttendList>? data;

  factory GetHospitalAttendModel.fromJson(Map<String, dynamic> json) =>
      GetHospitalAttendModel(
        status: json["Status"] == null ? null : json["Status"],
        data: json["Data"] == null
            ? null
            : List<GetHospitalAttendList>.from(
                json["Data"].map((x) => GetHospitalAttendList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "Data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetHospitalAttendList {
  GetHospitalAttendList({
    this.id,
    this.driverId,
    this.hospitalId,
    this.latitude,
    this.longitude,
    this.location,
    this.time,
    this.photo,
    this.collection,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int? id;
  int? driverId;
  String? hospitalId;
  String? latitude;
  String? longitude;
  String? location;
  DateTime? time;
  String? photo;
  String? collection;
  dynamic comment;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;

  factory GetHospitalAttendList.fromJson(Map<String, dynamic> json) =>
      GetHospitalAttendList(
        id: json["id"] == null ? null : json["id"],
        driverId: json["driver_id"] == null ? null : json["driver_id"],
        hospitalId: json["hospital_id"] == null ? null : json["hospital_id"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        location: json["location"] == null ? null : json["location"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        photo: json["photo"] == null ? null : json["photo"],
        collection: json["collection"] == null ? null : json["collection"],
        comment: json["comment"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "driver_id": driverId == null ? null : driverId,
        "hospital_id": hospitalId == null ? null : hospitalId,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "location": location == null ? null : location,
        "time": time == null ? null : time?.toIso8601String(),
        "photo": photo == null ? null : photo,
        "collection": collection == null ? null : collection,
        "comment": comment,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "name": name == null ? null : name,
      };
}
