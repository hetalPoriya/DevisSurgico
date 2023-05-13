import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/sharedPref_.dart';

class ServerConstants {
  static String Id = PreferencesManager.getString('id');
  static String BASE_URL = 'https://devissurgico.com/gwaliorcms/api/v1/';

  //'https://devissurgico.com/gwaliorcms/';
  // "http://sh021.hostgator.tempwebhost.net/~synraiar/devissurgico/api/v1/";
  static String login = BASE_URL + "login";
  static String driverRoute =
      BASE_URL + "get-routes-by-driver/${PreferencesManager.getString('id')}";
  static String hospitalRoute = BASE_URL +
      "get-hospitals-by-route/${PreferencesManager.getInt(AppStrings.routeByDriverId)}";
  static String attendanceIn = BASE_URL + "attendance-in";
  static String attendanceOut = BASE_URL + "attendance-out";
  static String hospitalAttend = BASE_URL + "hospital-attend";
  static String getHospitalAttend =
      BASE_URL + "hospital-attend/${PreferencesManager.getString('id')}";
  static String hospitalAttendData = BASE_URL +
      "hospital-attend/${PreferencesManager.getString('id')}?status=Collected";
  static String hospitalPartially = BASE_URL +
      "hospital-attend/${PreferencesManager.getString('id')}?status=HCF Non-Collected";
  static String hospitalDenied = BASE_URL +
      "hospital-attend/${PreferencesManager.getString('id')}?status=Drop";
}
