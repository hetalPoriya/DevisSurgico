/// Status : true
/// Data : [{"id":14,"driver_id":1,"hospital_id":"G794","latitude":"28.5970951","longitude":"77.3483214","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/Mj1B9iU6G6mhqu9OgNJVLjjlxarhWoL0lvPTq9Se.jpg","status":"Denied","created_at":"2022-09-15T09:35:04.000000Z","updated_at":"2022-09-15T09:35:04.000000Z","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"}]

class HospitalDenied {
  HospitalDenied({
      bool? status, 
      List<HospitalDeniedData>? data,}){
    _status = status;
    _data = data;
}

  HospitalDenied.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(HospitalDeniedData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<HospitalDeniedData>? _data;
HospitalDenied copyWith({  bool? status,
  List<HospitalDeniedData>? data,
}) => HospitalDenied(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<HospitalDeniedData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 14
/// driver_id : 1
/// hospital_id : "G794"
/// latitude : "28.5970951"
/// longitude : "77.3483214"
/// time : "2022-08-09 10:00:24"
/// photo : "public/hospital-attend/Mj1B9iU6G6mhqu9OgNJVLjjlxarhWoL0lvPTq9Se.jpg"
/// status : "Denied"
/// created_at : "2022-09-15T09:35:04.000000Z"
/// updated_at : "2022-09-15T09:35:04.000000Z"
/// name : "V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"

class HospitalDeniedData {
  HospitalDeniedData({
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

  HospitalDeniedData.fromJson(dynamic json) {
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
HospitalDeniedData copyWith({  num? id,
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
}) => HospitalDeniedData(  id: id ?? _id,
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