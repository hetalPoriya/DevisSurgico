import 'package:dio/dio.dart';
import 'package:driver_apps/api/serverConstant.dart';
import 'package:driver_apps/model/Hospital.dart';
import 'package:driver_apps/model/get_hospital_attend_model.dart';
import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import '../model/Attendance_in_model.dart';
import '../model/Attendance_out_model.dart';
import '../model/Hospital_attend_model.dart';
import '../model/Hospital_denied.dart';
import '../model/Hospital_partially_model.dart';
import '../model/Login_model.dart';
import '../model/Route_by_driver_model.dart';
import '../model/Route_by_hospital_model.dart';
import 'ApiHelper.dart';

class LoginApi {
  static Future<LoginModel> logIn(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.login, data: payload);
    return LoginModel.fromJson(response.data);
  }

  static Future<RouteByDriverModel> driverRoutes() async {
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.driverRoute);
    print('RESPONSEDATA ${response.data}');
    print('RESPONSEDATA ${RouteByDriverModel.fromMap(response.data)}');
    return RouteByDriverModel.fromMap(response.data);
  }

  static Future<GetHospitalAttendModel> getHospitalAttendModel(
      {required String hospital_id, String? from_time, String? to_time}) async {
    print(hospital_id);
    print(from_time);
    Response response = await ApiHelper.getDioClient().get(
        '${ServerConstants.getHospitalAttend}?hospital_id=$hospital_id&from_time=$from_time&to_time=$to_time');
    print('getHospitalAttend ${response.data}');
    print(
        'getHospitalAttend ${GetHospitalAttendModel.fromJson(response.data)}');
    return GetHospitalAttendModel.fromJson(response.data);
  }

  static Future<RouteByHospitalModel> hospitalRoutes() async {
    print(
        '${"get-hospitals-by-route/${PreferencesManager.getInt(AppStrings.routeByDriverId)}"}');
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.hospitalRoute);
    return RouteByHospitalModel.fromJson(response.data);
  }

  static Future<AttendanceInModel> attandencesIn(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.attendanceIn, data: payload);
    return AttendanceInModel.fromJson(response.data);
  }

  static Future<AttendanceOutModel> attendanceOuts(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.attendanceOut, data: payload);
    return AttendanceOutModel.fromJson(response.data);
  }

  static Future<HospitalAttendModel> hospitalAttends(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.hospitalAttend, data: payload);
    return HospitalAttendModel.fromJson(response.data);
  }

  static Future<Hospital> hospitalData() async {
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.hospitalAttendData);
    return Hospital.fromJson(response.data);
  }

  static Future<HospitalPartiallyModel> hospitalPartial() async {
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.hospitalPartially);
    return HospitalPartiallyModel.fromJson(response.data);
  }

  static Future<HospitalDenied> hospitalDenieData() async {
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.hospitalDenied);
    return HospitalDenied.fromJson(response.data);
  }
}
