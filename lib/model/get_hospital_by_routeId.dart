// To parse this JSON data, do
//
//     final getHospitalByRouteId = getHospitalByRouteIdFromMap(jsonString);

import 'dart:convert';

GetHospitalByRouteId getHospitalByRouteIdFromMap(String str) => GetHospitalByRouteId.fromMap(json.decode(str));

String getHospitalByRouteIdToMap(GetHospitalByRouteId data) => json.encode(data.toMap());

class GetHospitalByRouteId {
  GetHospitalByRouteId({
    this.status,
    this.data,
  });

  bool? status;
  List<GetHospitalBuRoutIdList>? data;

  factory GetHospitalByRouteId.fromMap(Map<String, dynamic> json) => GetHospitalByRouteId(
    status: json["Status"] == null ? null : json["Status"],
    data: json["Data"] == null ? null : List<GetHospitalBuRoutIdList>.from(json["Data"].map((x) => GetHospitalBuRoutIdList?.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class GetHospitalBuRoutIdList {
  GetHospitalBuRoutIdList({
    this.hospitalId,
    this.hospitalType,
    this.name,
    this.address,
    this.contact,
    this.mobile,
    this.phone,
  });

  String? hospitalId;
  String? hospitalType;
  String? name;
  String? address;
  String? contact;
  String? mobile;
  String? phone;

  factory GetHospitalBuRoutIdList.fromMap(Map<String, dynamic> json) => GetHospitalBuRoutIdList(
    hospitalId: json["hospital_id"] == null ? null : json["hospital_id"],
    hospitalType: json["hospital_type"] == null ? null : json["hospital_type"],
    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    contact: json["contact"] == null ? null : json["contact"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toMap() => {
    "hospital_id": hospitalId == null ? null : hospitalId,
    "hospital_type": hospitalType == null ? null : hospitalType,
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "contact": contact == null ? null : contact,
    "mobile": mobile == null ? null : mobile,
    "phone": phone == null ? null : phone,
  };
}
