/// id : 2
/// driver_id : 1
/// in_time : "2022-09-08 10:00:24"
/// in_latitude : "26.2124"
/// in_longitude : "78.1772"
/// in_photo : "public/attendance/WJgMfZsa1bSjh66uXifem96oxj8H50hBwRgqBmyu.png"
/// out_time : "2022-09-09 18:00:24"
/// out_latitude : "26.2124"
/// out_longitude : "78.1772"
/// out_photo : "public/attendance/Rr8L9tCKG6ow5ahoRG6lOGUfsYtapgWyxFkbLH71.jpg"
/// created_at : "2022-09-09T06:27:30.000000Z"
/// updated_at : "2022-09-09T06:35:27.000000Z"

class AttendanceOutModel {
  AttendanceOutModel({
    num? id,
    num? driverId,
    String? inTime,
    String? inLatitude,
    String? inLongitude,
    String? inPhoto,
    String? outTime,
    String? outLatitude,
    String? outLongitude,
    String? outPhoto,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _driverId = driverId;
    _inTime = inTime;
    _inLatitude = inLatitude;
    _inLongitude = inLongitude;
    _inPhoto = inPhoto;
    _outTime = outTime;
    _outLatitude = outLatitude;
    _outLongitude = outLongitude;
    _outPhoto = outPhoto;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  AttendanceOutModel.fromJson(dynamic json) {
    _id = json['id'];
    _driverId = json['driver_id'];
    _inTime = json['in_time'];
    _inLatitude = json['in_latitude'];
    _inLongitude = json['in_longitude'];
    _inPhoto = json['in_photo'];
    _outTime = json['out_time'];
    _outLatitude = json['out_latitude'];
    _outLongitude = json['out_longitude'];
    _outPhoto = json['out_photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _driverId;
  String? _inTime;
  String? _inLatitude;
  String? _inLongitude;
  String? _inPhoto;
  String? _outTime;
  String? _outLatitude;
  String? _outLongitude;
  String? _outPhoto;
  String? _createdAt;
  String? _updatedAt;

  AttendanceOutModel copyWith({
    num? id,
    num? driverId,
    String? inTime,
    String? inLatitude,
    String? inLongitude,
    String? inPhoto,
    String? outTime,
    String? outLatitude,
    String? outLongitude,
    String? outPhoto,
    String? createdAt,
    String? updatedAt,
  }) =>
      AttendanceOutModel(
        id: id ?? _id,
        driverId: driverId ?? _driverId,
        inTime: inTime ?? _inTime,
        inLatitude: inLatitude ?? _inLatitude,
        inLongitude: inLongitude ?? _inLongitude,
        inPhoto: inPhoto ?? _inPhoto,
        outTime: outTime ?? _outTime,
        outLatitude: outLatitude ?? _outLatitude,
        outLongitude: outLongitude ?? _outLongitude,
        outPhoto: outPhoto ?? _outPhoto,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get driverId => _driverId;

  String? get inTime => _inTime;

  String? get inLatitude => _inLatitude;

  String? get inLongitude => _inLongitude;

  String? get inPhoto => _inPhoto;

  String? get outTime => _outTime;

  String? get outLatitude => _outLatitude;

  String? get outLongitude => _outLongitude;

  String? get outPhoto => _outPhoto;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['driver_id'] = _driverId;
    map['in_time'] = _inTime;
    map['in_latitude'] = _inLatitude;
    map['in_longitude'] = _inLongitude;
    map['in_photo'] = _inPhoto;
    map['out_time'] = _outTime;
    map['out_latitude'] = _outLatitude;
    map['out_longitude'] = _outLongitude;
    map['out_photo'] = _outPhoto;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
