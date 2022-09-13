/// driver_id : "1"
/// hospital_id : "G789"
/// latitude : "26.2124"
/// longitude : "78.1772"
/// time : "2022-08-09 10:00:24"
/// photo : ""
/// status : "Done"
/// updated_at : "2022-09-09T06:11:26.000000Z"
/// created_at : "2022-09-09T06:11:26.000000Z"
/// id : 3

class HospitalAttendModel {
  HospitalAttendModel({
    String? driverId,
    String? hospitalId,
    String? latitude,
    String? longitude,
    String? time,
    String? photo,
    String? status,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _driverId = driverId;
    _hospitalId = hospitalId;
    _latitude = latitude;
    _longitude = longitude;
    _time = time;
    _photo = photo;
    _status = status;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  HospitalAttendModel.fromJson(dynamic json) {
    _driverId = json['driver_id'];
    _hospitalId = json['hospital_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _time = json['time'];
    _photo = json['photo'];
    _status = json['status'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _driverId;
  String? _hospitalId;
  String? _latitude;
  String? _longitude;
  String? _time;
  String? _photo;
  String? _status;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  HospitalAttendModel copyWith({
    String? driverId,
    String? hospitalId,
    String? latitude,
    String? longitude,
    String? time,
    String? photo,
    String? status,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) =>
      HospitalAttendModel(
        driverId: driverId ?? _driverId,
        hospitalId: hospitalId ?? _hospitalId,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        time: time ?? _time,
        photo: photo ?? _photo,
        status: status ?? _status,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
      );

  String? get driverId => _driverId;

  String? get hospitalId => _hospitalId;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  String? get time => _time;

  String? get photo => _photo;

  String? get status => _status;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_id'] = _driverId;
    map['hospital_id'] = _hospitalId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['time'] = _time;
    map['photo'] = _photo;
    map['status'] = _status;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
