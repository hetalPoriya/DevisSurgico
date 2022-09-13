import 'package:driver_apps/components_screen/attendance.dart';
import 'package:driver_apps/components_screen/task_incomplete_screen.dart';
import 'package:driver_apps/logIn_screen/login.dart';
import 'package:driver_apps/components_screen/profile.dart';
import 'package:driver_apps/components_screen/route_screens/route.dart';
import 'package:flutter/material.dart';

import '../components_screen/notification_screen.dart';
import '../components_screen/task_complete_screen.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _data = [
     {
      'title': "Route",
      'page': const RouteScreen(
        id: '1',
        name: "route",
      )
     
    },
   
    {
      'title': "Task Completed",
      'page': const TaskCompleteSCreen(
        id: '2',
        name: "taskComplete",
      )
      
    },
    {
      'title': "Task Incompleted",
      'page': const TaskIncomplete(
        id: '3',
        name: "taskIncomplete",
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
      'title': "Attendance",
      'icon': Icons.mark_chat_read,
      'page': const Attendance(
        id: '2',
        name: "Attendance",
      )
    },
    {
      'title': "Notifications",
      'icon': Icons.notifications,
       'page': const NotificationScreen(
        id:'3',
        name:"NotificationSCreen",
       )
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Welcome User"),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'logout Icon',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: const Text('Do you want to logout?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side:
                                          const BorderSide(color: Colors.grey)),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color:  Color(0XFFB71C1C),
                                  ),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  prefs?.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0XFFB71C1C),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                child: const Text("Logout")),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
            backgroundColor:const Color(0XFFB71C1C),
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
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Services Reminders",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0XFFB71C1C),
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
                            color:Colors.redAccent[100],
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
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "User Settings",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0XFFB71C1C),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
