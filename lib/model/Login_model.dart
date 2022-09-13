/// id : 1
/// name : "Driver 1"
/// mobile : "1234567890"
/// password : "$2y$10$TT9PWKLJXPJXQWElybksUu7RRQXpmcF3ww1h2XxyLZ.3fPomGRC1i"
/// device_id : null

class LoginModel {
  LoginModel({
    num? id,
    String? name,
    String? mobile,
    String? password,
    dynamic deviceId,
  }) {
    _id = id;
    _name = name;
    _mobile = mobile;
    _password = password;
    _deviceId = deviceId;
  }

  LoginModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _password = json['password'];
    _deviceId = json['device_id'];
  }

  num? _id;
  String? _name;
  String? _mobile;
  String? _password;
  dynamic _deviceId;

  LoginModel copyWith({
    num? id,
    String? name,
    String? mobile,
    String? password,
    dynamic deviceId,
  }) =>
      LoginModel(
        id: id ?? _id,
        name: name ?? _name,
        mobile: mobile ?? _mobile,
        password: password ?? _password,
        deviceId: deviceId ?? _deviceId,
      );

  num? get id => _id;

  String? get name => _name;

  String? get mobile => _mobile;

  String? get password => _password;

  dynamic get deviceId => _deviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['device_id'] = _deviceId;
    return map;
  }
}
