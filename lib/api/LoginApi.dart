
import 'package:dio/dio.dart';
import 'package:driver_apps/api/serverConstant.dart';
import 'package:driver_apps/model/Hospital.dart';
import '../model/Attendance_in_model.dart';
import '../model/Attendance_out_model.dart';
import '../model/Hospital_attend_model.dart';
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
    return RouteByDriverModel.fromJson(response.data);
  }

  static Future<RouteByHospitalModel> hospitalRoutes() async {
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

}
