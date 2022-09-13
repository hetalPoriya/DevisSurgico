/// id : 1
/// name : "Route 1"
/// hospital_id : "G797,G795,G794"
/// status : 1
/// created_at : "2022-08-04T11:56:01.000000Z"
/// updated_at : "2022-08-04T11:56:34.000000Z"

class RouteByDriverModel {
  RouteByDriverModel({
    num? id,
    String? name,
    String? hospitalId,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _hospitalId = hospitalId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  RouteByDriverModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _hospitalId = json['hospital_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  String? _hospitalId;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  RouteByDriverModel copyWith({
    num? id,
    String? name,
    String? hospitalId,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      RouteByDriverModel(
        id: id ?? _id,
        name: name ?? _name,
        hospitalId: hospitalId ?? _hospitalId,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  String? get hospitalId => _hospitalId;

  num? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['hospital_id'] = _hospitalId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
