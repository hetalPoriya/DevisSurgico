/// Status : true
/// Data : [{"id":1,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/1KKlGu1MbqYvYe2oaPqI3Z3TD9GRArDEk3ytiX3w.jpg,public/hospital-attend/0mykBvn9ss055hEgfWgIbWjuC0kJ9wT77PcMUO35.jpg,public/hospital-attend/5HpoLKdvUtrbfgAUsHMbP2SDrgAku6SlGIr3nPeI.jpg","status":"Done","created_at":"2022-09-09T05:29:28.000000Z","updated_at":"2022-09-09T05:29:28.000000Z","name":"P H C"},{"id":2,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-09T06:05:40.000000Z","updated_at":"2022-09-09T06:05:40.000000Z","name":"P H C"},{"id":3,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-09T06:11:26.000000Z","updated_at":"2022-09-09T06:11:26.000000Z","name":"P H C"},{"id":4,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-13T07:07:35.000000Z","updated_at":"2022-09-13T07:07:35.000000Z","name":"P H C"},{"id":6,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-13T20:14:15.000000Z","updated_at":"2022-09-13T20:14:15.000000Z","name":"P H C"},{"id":9,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-14T11:45:33.000000Z","updated_at":"2022-09-14T11:45:33.000000Z","name":"P H C"},{"id":10,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-14T11:49:34.000000Z","updated_at":"2022-09-14T11:49:34.000000Z","name":"P H C"},{"id":13,"driver_id":1,"hospital_id":"G789","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"","status":"Done","created_at":"2022-09-14T15:30:23.000000Z","updated_at":"2022-09-14T15:30:23.000000Z","name":"P H C"},{"id":5,"driver_id":1,"hospital_id":"G794","latitude":"26.2124","longitude":"78.1772","time":"2022-08-09 10:00:24","photo":"public/hospital-attend/x8P6VDsLXnbucHHNsrfuvasOo5qg6kHrmEzBKrLc.jpg","status":"Done","created_at":"2022-09-13T20:09:50.000000Z","updated_at":"2022-09-13T20:09:50.000000Z","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"}]

class Hospital {
  Hospital({
      bool? status, 
      List<HospitalData>? data,}){
    _status = status;
    _data = data;
}

  Hospital.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(HospitalData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<HospitalData>? _data;
Hospital copyWith({  bool? status,
  List<HospitalData>? data,
}) => Hospital(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<HospitalData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// driver_id : 1
/// hospital_id : "G789"
/// latitude : "26.2124"
/// longitude : "78.1772"
/// time : "2022-08-09 10:00:24"
/// photo : "public/hospital-attend/1KKlGu1MbqYvYe2oaPqI3Z3TD9GRArDEk3ytiX3w.jpg,public/hospital-attend/0mykBvn9ss055hEgfWgIbWjuC0kJ9wT77PcMUO35.jpg,public/hospital-attend/5HpoLKdvUtrbfgAUsHMbP2SDrgAku6SlGIr3nPeI.jpg"
/// status : "Done"
/// created_at : "2022-09-09T05:29:28.000000Z"
/// updated_at : "2022-09-09T05:29:28.000000Z"
/// name : "P H C"

class HospitalData {
  HospitalData({
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

  HospitalData.fromJson(dynamic json) {
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
HospitalData copyWith({  num? id,
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
}) => HospitalData(  id: id ?? _id,
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