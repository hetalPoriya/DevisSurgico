/// driver_id : "1"
/// in_time : "2022-09-09 10:00:24"
/// in_latitude : "26.2124"
/// in_longitude : "78.1772"
/// in_photo : "public/attendance/RaskSYDIZqsxTJny6KZpLLHnvKVsUE71oV08OtHH.jpg"
/// updated_at : "2022-09-09T06:37:03.000000Z"
/// created_at : "2022-09-09T06:37:03.000000Z"
/// id : 3

class AttendanceInModel {
  AttendanceInModel({
    String? driverId,
    String? inTime,
    String? inLatitude,
    String? inLongitude,
    String? inPhoto,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) {
    _driverId = driverId;
    _inTime = inTime;
    _inLatitude = inLatitude;
    _inLongitude = inLongitude;
    _inPhoto = inPhoto;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  AttendanceInModel.fromJson(dynamic json) {
    _driverId = json['driver_id'];
    _inTime = json['in_time'];
    _inLatitude = json['in_latitude'];
    _inLongitude = json['in_longitude'];
    _inPhoto = json['in_photo'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _driverId;
  String? _inTime;
  String? _inLatitude;
  String? _inLongitude;
  String? _inPhoto;
  String? _updatedAt;
  String? _createdAt;
  num? _id;

  AttendanceInModel copyWith({
    String? driverId,
    String? inTime,
    String? inLatitude,
    String? inLongitude,
    String? inPhoto,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) =>
      AttendanceInModel(
        driverId: driverId ?? _driverId,
        inTime: inTime ?? _inTime,
        inLatitude: inLatitude ?? _inLatitude,
        inLongitude: inLongitude ?? _inLongitude,
        inPhoto: inPhoto ?? _inPhoto,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
      );

  String? get driverId => _driverId;

  String? get inTime => _inTime;

  String? get inLatitude => _inLatitude;

  String? get inLongitude => _inLongitude;

  String? get inPhoto => _inPhoto;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_id'] = _driverId;
    map['in_time'] = _inTime;
    map['in_latitude'] = _inLatitude;
    map['in_longitude'] = _inLongitude;
    map['in_photo'] = _inPhoto;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
