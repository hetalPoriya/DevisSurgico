// // ignore_for_file: prefer_const_constructors
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:driver_apps/home_screen/home.dart';
// import 'package:driver_apps/utils/app_colors.dart';
// import 'package:driver_apps/utils/app_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../api/LoginApi.dart';
//
// class AttendanceOut extends StatefulWidget {
//   final String? id;
//   final String? name;
//   const AttendanceOut({Key? key, this.id, this.name}) : super(key: key);
//
//   @override
//   State<AttendanceOut> createState() => _AttendanceOutState();
// }
//
// class _AttendanceOutState extends State<AttendanceOut> {
//   DateTime todayDate = DateTime.now();
//   File? image;
//   Position? position;
//   @override
//   void initState() {
//     // TODO: implement initState
//     getCurrentLocation();
//     super.initState();
//   }
//
//   Future pickImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) return;
//
//     final imageTemporary = File(image.path);
//     setState(() => this.image = imageTemporary);
//
//   }
//
//   getImageData(image) {
//     if (image == null) {
//       return const AssetImage("assets/profile.png");
//     }
//     return FileImage(image);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       child: Scaffold(
//         appBar:AppWidget.appBarWidget(text: 'AttendanceOut Out'),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: const Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: getImageData(image),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                         bottom: 1,
//                         right: 30,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                             color: AppColors.appBarColor,
//                           ),
//                           child: InkWell(
//                             onTap: () => pickImage(),
//                             child: const Icon(
//                               Icons.camera_alt,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               // const SizedBox(height: 40),
//
//               const SizedBox(height: 30),
//               // const Text(
//               //   "Username",
//               //   style: TextStyle(
//               //       fontSize: 19,
//               //       color: Colors.black,
//               //       fontWeight: FontWeight.bold
//               //   ),
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:  [
//                   Icon(Icons.location_on),
//                   SizedBox(width: 10,),
//                   Expanded(
//                     child: Text(
//                       position.toString(),
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const Text(
//                         "Date : ",
//                         style: TextStyle(
//                             fontSize: 19,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         DateFormat('dd-MM-yyyy').format(DateTime.now()),
//                         style: const TextStyle(
//                           fontSize: 19,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const Text(
//                         "Time : ",
//                         style: TextStyle(
//                             fontSize: 19,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         DateFormat().add_jm().format(todayDate).toString(),
//                         style: const TextStyle(
//                           fontSize: 19,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               ),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   outAttendanceOut();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: AppColors.appBarColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text(
//                   "AttendanceOut Out",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
//
//   void getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       print(position);
//       this.position = position;
//     });
//   }
//
//
//   void outAttendanceOut() async {
//     MultipartFile images=await MultipartFile.fromFile(image!.path.toString(),filename: image.toString() + ".png");
//
//     LoginApi.attendanceOuts(
//       FormData.fromMap(
//         {
//           "driver_id": "1",
//           "in_time": "2022-08-09 10:00:24",
//           "in_latitude": position?.latitude.toString(),
//           "in_longitude": position?.longitude.toString(),
//           "in_photo": images,
//           "out_time": "2022-08-09 10:00:24",
//           "out_latitude": position?.latitude.toString(),
//           "out_longitude": position?.longitude.toString(),
//           "out_photo": images
//         },
//       ),
//     ).then((value) {
//       // setState(() {
//       //   isLoading = false;
//       // });
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         ),
//       );
//     });
//   }
// }
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

class AttendanceOut extends StatefulWidget {
  final String id;
  final String name;

  const AttendanceOut({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<AttendanceOut> createState() => _AttendanceOutState();
}

class _AttendanceOutState extends State<AttendanceOut> {
  String? currentDate;

  String? currentDay;
  int? onlyCurrentDate;
  String? currentTime;
  DateTime dateTime = DateTime.now();
  File? image;
  Position? position;
  bool? loading;

  getDateData() {
    if (PreferencesManager.getBool(AppStrings.isAttendanceIn) == true) {
      setState(() {
        currentDate = DateFormat.yMMMMd().format(DateTime.now());
        currentDay = DateFormat('EEEE').format(DateTime.now());
        currentTime = DateFormat("hh:mm a").format(DateTime.now());
        PreferencesManager.setInt(AppStrings.onlyCurrentDate, 0);
      });
    } else {
      if (PreferencesManager.getInt(AppStrings.onlyCurrentDate) ==
          dateTime.day) {
        setState(() {
          currentDate = PreferencesManager.getString(
              AppStrings.currentDateForAttendanceOut);
          currentTime = PreferencesManager.getString(
              AppStrings.currentTimeForAttendanceOut);
          currentDay = PreferencesManager.getString(
              AppStrings.currentDayForAttendanceOut);
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

  _setData() {
    DateTime now = new DateTime.now();
    PreferencesManager.setString(
        AppStrings.currentDateForAttendanceOut, currentDate.toString());
    PreferencesManager.setString(
        AppStrings.currentTimeForAttendanceOut, currentTime.toString());
    PreferencesManager.setString(
        AppStrings.currentDayForAttendanceOut, currentDay.toString());
    PreferencesManager.setInt(AppStrings.onlyCurrentDate, now.day);
    PreferencesManager.setBool(AppStrings.isAttendanceIn, false);
  }

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

  @override
  void initState() {
    getDateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidget.appBarWidget(text: 'Attendance - out'),
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
                                    false ||
                                PreferencesManager.getInt(
                                        AppStrings.onlyCurrentDate) ==
                                    dateTime.day)
                            ? CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(Icons.done),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.orange.shade600),
                        onTap: pickImage,
                      ),
                      AppWidget.submitButton(
                        onPressed: () {
                          if (image == null) {
                            Fluttertoast.showToast(
                                msg: 'Please add picture',
                                backgroundColor: Colors.white,
                                textColor: Colors.black);
                          } else {
                            if (PreferencesManager.getBool(
                                    AppStrings.isAttendanceIn) ==
                                true) {
                              outAttendanceOut();
                            } else {
                              DateTime dateTime = DateTime.now();
                              if (PreferencesManager.getInt(
                                      AppStrings.onlyCurrentDate) ==
                                  dateTime.day) {
                                Fluttertoast.showToast(
                                    msg: 'You already done attendance out',
                                    textColor: Colors.black,
                                    backgroundColor: Colors.white);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Sorry, Attendance not in',
                                    textColor: Colors.black,
                                    backgroundColor: Colors.white);
                              }
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
                if (loading == true) Center(child: CircularProgressIndicator()),
              ],
            )),
      ),
    );
  }

  void outAttendanceOut() async {
    position = await AppWidget.getCurrentLocation();

    String dateFormat =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    setState(() {
      this.position = position;
      loading = true;
    });

    MultipartFile images = await MultipartFile.fromFile(image!.path.toString(),
        filename: image.toString());

    print('Image $image');
    print('Image $images');
    LoginApi.attendanceOuts(
      FormData.fromMap(
        {
          "driver_id": PreferencesManager.getString('id'),
          "in_time": PreferencesManager.getString(AppStrings.currentTime),
          "in_latitude": position?.latitude.toString(),
          "in_longitude": position?.longitude.toString(),
          "out_time": dateFormat,
          "out_latitude": position?.latitude.toString(),
          "out_longitude": position?.longitude.toString(),
          "out_photo": images
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
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }
}
