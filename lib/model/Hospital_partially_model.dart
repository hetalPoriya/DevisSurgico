/// Status : true
/// Data : [{"id":7,"driver_id":1,"hospital_id":"G794","latitude":"28.6135356","longitude":"77.284997","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/3Y3Z7t7KXlpaoNr193vVRpidlz8F0ThQKqoXXLv3.jpg","status":"Partially","created_at":"2022-09-13T21:02:29.000000Z","updated_at":"2022-09-13T21:02:29.000000Z","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"},{"id":11,"driver_id":1,"hospital_id":"G794","latitude":"28.6135241","longitude":"77.2850134","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/XhloUChE9vAzs3XQeryNPHXTQwT2E2SQrXlm2osc.jpg","status":"Partially","created_at":"2022-09-14T12:03:40.000000Z","updated_at":"2022-09-14T12:03:40.000000Z","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"},{"id":12,"driver_id":1,"hospital_id":"G794","latitude":"28.6135069","longitude":"77.2850089","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/9S3qyyO6EQiJrhW457jgNiXJ1WwfAJ10TtFrXmR4.jpg","status":"Partially","created_at":"2022-09-14T12:06:47.000000Z","updated_at":"2022-09-14T12:06:47.000000Z","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"},{"id":8,"driver_id":1,"hospital_id":"G795","latitude":"28.6135189","longitude":"77.2849997","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/bJOffuvFTRKJoHGl7ugyNcR0D0wxU8ReiJ6YWnhs.jpg","status":"Partially","created_at":"2022-09-14T11:42:31.000000Z","updated_at":"2022-09-14T11:42:31.000000Z","name":"YASHODA HOSPITAL "}]

class HospitalPartiallyModel {
  HospitalPartiallyModel({
      bool? status, 
      List<HospitalPartiallyData>? data,}){
    _status = status;
    _data = data;
}

  HospitalPartiallyModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(HospitalPartiallyData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<HospitalPartiallyData>? _data;
HospitalPartiallyModel copyWith({  bool? status,
  List<HospitalPartiallyData>? data,
}) => HospitalPartiallyModel(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<HospitalPartiallyData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// driver_id : 1
/// hospital_id : "G794"
/// latitude : "28.6135356"
/// longitude : "77.284997"
/// time : "2022-08-09 10:00:24"
/// photo : "public/hospital-attend/3Y3Z7t7KXlpaoNr193vVRpidlz8F0ThQKqoXXLv3.jpg"
/// status : "Partially"
/// created_at : "2022-09-13T21:02:29.000000Z"
/// updated_at : "2022-09-13T21:02:29.000000Z"
/// name : "V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"

class HospitalPartiallyData {
  HospitalPartiallyData({
      num? id, 
      num? driverId, 
      String? hospitalId, 
      String? latitude, 
      String? longitude, 
      String? time, 
      String? photo, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? name,}){
    _id = id;
    _driverId = driverId;
    _hospitalId = hospitalId;
    _latitude = latitude;
    _longitude = longitude;
    _time = time;
    _photo = photo;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
}

  HospitalPartiallyData.fromJson(dynamic json) {
    _id = json['id'];
    _driverId = json['driver_id'];
    _hospitalId = json['hospital_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _time = json['time'];
    _photo = json['photo'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
  }
  num? _id;
  num? _driverId;
  String? _hospitalId;
  String? _latitude;
  String? _longitude;
  String? _time;
  String? _photo;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
HospitalPartiallyData copyWith({  num? id,
  num? driverId,
  String? hospitalId,
  String? latitude,
  String? longitude,
  String? time,
  String? photo,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? name,
}) => HospitalPartiallyData(  id: id ?? _id,
  driverId: driverId ?? _driverId,
  hospitalId: hospitalId ?? _hospitalId,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  time: time ?? _time,
  photo: photo ?? _photo,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  name: name ?? _name,
);
  num? get id => _id;
  num? get driverId => _driverId;
  String? get hospitalId => _hospitalId;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get time => _time;
  String? get photo => _photo;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['driver_id'] = _driverId;
    map['hospital_id'] = _hospitalId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['time'] = _time;
    map['photo'] = _photo;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['name'] = _name;
    return map;
  }

}