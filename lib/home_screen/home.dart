import 'package:driver_apps/components_screen/all_routes.dart';
import 'package:driver_apps/components_screen/attendance.dart';
import 'package:driver_apps/components_screen/attendance_in.dart';
import 'package:driver_apps/components_screen/route_screens/route_detail.dart';
import 'package:driver_apps/logIn_screen/login.dart';
import 'package:driver_apps/components_screen/profile.dart';
import 'package:driver_apps/components_screen/route_screens/route.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:flutter/material.dart';

import '../components_screen/attandance_out.dart';
import '../components_screen/notification_screen.dart';
import '../components_screen/route_details_screens.dart';
import '../components_screen/task_complete_screen.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _data = [
    {'title': "Route", 'page': const RouteDataList()},
    // {
    //   'title': "Route",
    //   'page': const RouteDetail(
    //     id: '1',
    //     name: "route",
    //   )
    // },
    {
      'title': "Task",
      'page': const TaskCompleteSCreen(
        id: '2',
        name: "taskComplete",
      )
    },
  ];
  final List<Map<String, dynamic>> _userdata = [
    {
      'title': "Profile",
      'icon': Icons.person,
      'page': const Profile(
        id: '1',
        name: "profile",
      )
    },
    {
      'title': "Attendance-In",
      'icon': Icons.mark_chat_read,
      'page': AttendanceIn(
        id: '2',
        name: "Attendance-In",
      )
      // 'page':  Attendance(
      //   id: '2',
      //   name: "Attendance-In",
      // )
    },
    // {
    //   'title': "Notifications",
    //   'icon': Icons.notifications,
    //   'page': const NotificationScreen(
    //     id: '3',
    //     name: "NotificationSCreen",
    //   )
    // },
    {
      'title': "Attendance-Out",
      'icon': Icons.mark_chat_read,
      'page': AttendanceOut(
        id: '4',
        name: "Attendance-Out",
      )
    },
  ];

  @override
  void initState() {
    AppWidget.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Welcome User"),
            leading: Container(),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'logout Icon',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Do you want to logout?'),
                        actions: [
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(color: Colors.grey)),
                                primary: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: AppColors.appBarColor,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                PreferencesManager.clear();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginScreen(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.appBarColor,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              child: const Text("Logout")),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
            backgroundColor: AppColors.appBarColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Services Reminders",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.appBarColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: _data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _data[index]['page']),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            // gradient: _data[index]['color'],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text(
                                    //   _data[index]['count'],
                                    //   style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    Text(
                                      _data[index]['title'],
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      // textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "User Settings",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.appBarColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: _userdata.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _userdata[index]['page']),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            // color: const Color(0XFFFFCDD2),
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      _userdata[index]['icon'],
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    Text(
                                      _userdata[index]['title'],
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
