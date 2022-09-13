import 'package:dio/dio.dart';
import 'package:driver_apps/api/serverConstant.dart';
import '../model/Attendance_in_model.dart';
import '../model/Attendance_out_model.dart';
import '../model/Hospital_attend_model.dart';
import '../model/Hospital_attendence_data_model.dart';
import '../model/Login_model.dart';
import '../model/Route_by_driver_model.dart';
import '../model/Route_by_hospital_model.dart';
import 'apiHelper.dart';

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

  static Future<AttendanceOutModel> attandenceOuts(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.attendanceOut, data: payload);
    return AttendanceOutModel.fromJson(response.data);
  }

  static Future<HospitalAttendModel> hospitalAttends(payload) async {
    Response response = await ApiHelper.getDioClientWithUrlencoded()
        .post(ServerConstants.hospitalAttend, data: payload);
    return HospitalAttendModel.fromJson(response.data);
  }

  static Future<HospitalAttendenceDataModel> hospitalData() async {
    Response response =
        await ApiHelper.getDioClient().get(ServerConstants.hospitalAttendData);
    return HospitalAttendenceDataModel.fromJson(response.data);
  }
}
