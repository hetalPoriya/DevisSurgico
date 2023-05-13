import 'dart:io';

import 'package:dio/dio.dart';
import 'package:driver_apps/api/LoginApi.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_images.dart';
import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../home_screen/home.dart';

class AttendanceIn extends StatefulWidget {
  final String id;
  final String name;

  const AttendanceIn({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<AttendanceIn> createState() => _AttendanceInState();
}

class _AttendanceInState extends State<AttendanceIn> {
  String? currentDate;

  String? currentDay;
  int? onlyCurrentDate;
  String? currentTime;
  DateTime dateTime = DateTime.now();
  File? image;
  Position? position;
  bool? loading;

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() => this.image = imageTemporary);
  }

  getImageData(image) {
    if (image == null) {
      return AssetImage("assets/profile.png");
    }
    return FileImage(image);
  }

  _setData() {
    String dateFormat =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    DateTime now = new DateTime.now();
    PreferencesManager.setString(
        AppStrings.currentDate, currentDate.toString());
    PreferencesManager.setString(
        AppStrings.currentTime, currentTime.toString());
    PreferencesManager.setString(AppStrings.currentDay, currentDay.toString());
    PreferencesManager.setInt(AppStrings.onlyCurrentDate, now.day);
    PreferencesManager.setBool(AppStrings.isAttendanceIn, true);
    PreferencesManager.setString(AppStrings.inTime, dateFormat);
  }

  getDateData() {
    if (PreferencesManager.getBool(AppStrings.isAttendanceIn) == true) {
      print('If Conditon');
      setState(() {
        currentDate = PreferencesManager.getString(AppStrings.currentDate);
        currentTime = PreferencesManager.getString(AppStrings.currentTime);
        currentDay = PreferencesManager.getString(AppStrings.currentDay);
        onlyCurrentDate = PreferencesManager.getInt(AppStrings.onlyCurrentDate);
      });
    } else {
      if (PreferencesManager.getInt(AppStrings.onlyCurrentDate) ==
          dateTime.day) {
        setState(() {
          currentDate = PreferencesManager.getString(AppStrings.currentDate);
          currentTime = PreferencesManager.getString(AppStrings.currentTime);
          currentDay = PreferencesManager.getString(AppStrings.currentDay);
          onlyCurrentDate =
              PreferencesManager.getInt(AppStrings.onlyCurrentDate);
        });
      } else {
        setState(() {
          currentDate = DateFormat.yMMMMd().format(DateTime.now());
          currentDay = DateFormat('EEEE').format(DateTime.now());
          currentTime = DateFormat("hh:mm a").format(DateTime.now());
          PreferencesManager.setInt(AppStrings.onlyCurrentDate, 0);
        });
      }
    }
  }

  @override
  void initState() {
    getDateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidget.appBarWidget(text: 'Attendance - in'),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidget.attendanceWidget(
                          currentDate: currentDate.toString(),
                          currentDay: currentDay.toString(),
                          currentTime: currentTime.toString(),
                          image: getImageData(image),
                          iconWidget: (PreferencesManager.getBool(
                                          AppStrings.isAttendanceIn) ==
                                      true ||
                                  PreferencesManager.getInt(
                                          AppStrings.onlyCurrentDate) ==
                                      dateTime.day)
                              ? CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.done),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.orange.shade600),
                          onTap: pickImage),
                      AppWidget.submitButton(onPressed: () {
                        if (image == null) {
                          Fluttertoast.showToast(
                              msg: 'Please add picture',
                              backgroundColor: Colors.white,
                              textColor: Colors.black);
                        } else {
                          if (PreferencesManager.getBool(
                                      AppStrings.isAttendanceIn) ==
                                  false &&
                              PreferencesManager.getInt(
                                      AppStrings.onlyCurrentDate) !=
                                  dateTime.day) {
                            addAttendance();
                          } else {
                            Fluttertoast.showToast(
                                msg: 'You already add your attendance',
                                textColor: Colors.black,
                                backgroundColor: Colors.white);
                          }
                        }
                      }),
                    ],
                  ),
                ),
                if (loading == true) Center(child: CircularProgressIndicator()),
              ],
            )),
      ),
    );
  }

  void addAttendance() async {
    position = await AppWidget.getCurrentLocation();

    String dateFormat =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    setState(() {
      this.position = position;
      loading = true;
    });

    MultipartFile images = await MultipartFile.fromFile(image!.path.toString(),
        filename: image.toString() + ".png");

    LoginApi.attandencesIn(
      FormData.fromMap(
        {
          "driver_id": PreferencesManager.getString('id'),
          "in_time": dateFormat,
          "in_latitude": position?.latitude.toString(),
          "in_longitude": position?.longitude.toString(),
          "in_photo": images
        },
      ),
    ).then((value) async {
      await _setData();
      setState(() {
        loading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }
}
