/// Status : true
/// Data : [{"hospital_id":"G794","hospital_type":"51","name":"V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE","address":"A 39 BSF COLONY FIRST FLOOR, MAHARAJURA AIRPORT ROAD, GWALOR","contact":"ANURADH MATTA","mobile":"9826035108","phone":""},{"hospital_id":"G795","hospital_type":"45","name":"YASHODA HOSPITAL ","address":"NEAR DWARIKADISH MANDIR KUMHARPURA THATIPUR ","contact":"NIDHI GARG ","mobile":"","phone":""},{"hospital_id":"G797","hospital_type":"19","name":"Name","address":"Address","contact":"Contact Person","mobile":"1234567890","phone":"+1 (169) 868-2431"}]

class RouteByHospitalModel {
  RouteByHospitalModel({
      bool? status, 
      List<RouteByHospitalData>? data,}){
    _status = status;
    _data = data;
}

  RouteByHospitalModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(RouteByHospitalData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<RouteByHospitalData>? _data;
RouteByHospitalModel copyWith({  bool? status,
  List<RouteByHospitalData>? data,
}) => RouteByHospitalModel(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  List<RouteByHospitalData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// hospital_id : "G794"
/// hospital_type : "51"
/// name : "V CARE COLLECTION CENTRE,DR LAL PATHLABS COLLECTION CENTRE"
/// address : "A 39 BSF COLONY FIRST FLOOR, MAHARAJURA AIRPORT ROAD, GWALOR"
/// contact : "ANURADH MATTA"
/// mobile : "9826035108"
/// phone : ""

class RouteByHospitalData {
  RouteByHospitalData({
      String? hospitalId, 
      String? hospitalType, 
      String? name, 
      String? address, 
      String? contact, 
      String? mobile, 
      String? phone,}){
    _hospitalId = hospitalId;
    _hospitalType = hospitalType;
    _name = name;
    _address = address;
    _contact = contact;
    _mobile = mobile;
    _phone = phone;
}

  RouteByHospitalData.fromJson(dynamic json) {
    _hospitalId = json['hospital_id'];
    _hospitalType = json['hospital_type'];
    _name = json['name'];
    _address = json['address'];
    _contact = json['contact'];
    _mobile = json['mobile'];
    _phone = json['phone'];
  }
  String? _hospitalId;
  String? _hospitalType;
  String? _name;
  String? _address;
  String? _contact;
  String? _mobile;
  String? _phone;
RouteByHospitalData copyWith({  String? hospitalId,
  String? hospitalType,
  String? name,
  String? address,
  String? contact,
  String? mobile,
  String? phone,
}) => RouteByHospitalData(  hospitalId: hospitalId ?? _hospitalId,
  hospitalType: hospitalType ?? _hospitalType,
  name: name ?? _name,
  address: address ?? _address,
  contact: contact ?? _contact,
  mobile: mobile ?? _mobile,
  phone: phone ?? _phone,
);
  String? get hospitalId => _hospitalId;
  String? get hospitalType => _hospitalType;
  String? get name => _name;
  String? get address => _address;
  String? get contact => _contact;
  String? get mobile => _mobile;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hospital_id'] = _hospitalId;
    map['hospital_type'] = _hospitalType;
    map['name'] = _name;
    map['address'] = _address;
    map['contact'] = _contact;
    map['mobile'] = _mobile;
    map['phone'] = _phone;
    return map;
  }

}