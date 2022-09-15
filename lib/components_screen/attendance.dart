// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:driver_apps/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../api/LoginApi.dart';

class Attendance extends StatefulWidget {
  final String? id;
  final String? name;
  const Attendance({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  DateTime todayDate = DateTime.now();
  File? image;
  Position? position;
  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);

  }

  getImageData(image) {
    if (image == null) {
      return const AssetImage("assets/profile.png");
    }
    return FileImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Attendance"),
          backgroundColor: const Color(0XFFB71C1C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              //bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: getImageData(image),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 30,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: const Color(0XFFB71C1C),
                          ),
                          child: InkWell(
                            onTap: () => pickImage(),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              // const SizedBox(height: 40),

              const SizedBox(height: 30),
              const Text(
                "Username",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(Icons.location_on),
                  SizedBox(width: 10,),
                  Text(
                    position.toString(),
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Date : ",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Time : ",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat().add_jm().format(todayDate).toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  addAttendance();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFFB71C1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Mark Attendance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  void getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      print(position);
      this.position = position;
    });
  }


  void addAttendance() async {
    MultipartFile images=await MultipartFile.fromFile(image!.path.toString(),filename: image.toString() + ".png");

    LoginApi.attandencesIn(
      FormData.fromMap(
        {
          "driver_id": "1",
          "in_time": "2022-08-09 10:00:24",
          "in_latitude": position?.latitude.toString(),
          "in_longitude": position?.longitude.toString(),
          "in_photo": images
        },
      ),
    ).then((value) {
      // setState(() {
      //   isLoading = false;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

}
