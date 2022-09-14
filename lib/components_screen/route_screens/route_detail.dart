import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../../api/LoginApi.dart';
import '../../home_screen/home.dart';
import '../../model/Route_by_hospital_model.dart';

class RouteDetailsScreen extends StatefulWidget {
  RouteByHospitalData? routeByHospitalData;

  RouteDetailsScreen(this.routeByHospitalData);

  @override
  State<RouteDetailsScreen> createState() =>
      _RouteDetailsScreenState(routeByHospitalData);
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {
  RouteByHospitalData? routeByHospitalData;

  _RouteDetailsScreenState(this.routeByHospitalData);

  final List<String> _status = ["Done", "Partially", "Denied"];
  List<PickedFile?> pickedFile = [];
  String? status = "";
  Position? position;
  var isLoading = false;
  bool positionStreamStarted = false;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      this.position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Route Details"),
          backgroundColor: const Color(0XFFB71C1C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                //bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonFormField(
                          items: _status
                              .map((e) => DropdownMenuItem(
                                    onTap: () {},
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          hint: const Text("Status"),
                          onChanged: (String? _status) {
                            status = _status;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: OutlinedButton.icon(
                            label: const Text(""),
                            icon: const Icon(Icons.camera),
                            onPressed: () async {
                              final picker = ImagePicker();

                              picker
                                  .getImage(
                                      source: ImageSource.camera,
                                      imageQuality: 50)
                                  .then((value) => {
                                        setState(() {
                                          pickedFile.add(value);
                                        })
                                      });
                            },
                          ),
                        ),
                        if (pickedFile.isNotEmpty)
                          Wrap(
                            children: pickedFile
                                .map(
                                  (e) => Image.file(
                                    File(e!.path),
                                    height: MediaQuery.of(context).size.width,
                                  ),
                                )
                                .toList(),
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF263238)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => addServices(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (isLoading)
              const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }

  void addServices() async {
    setState(() {
      isLoading = true;
    });
    List<MultipartFile> images = [];

    for (int i = 0; i < pickedFile.length; i++) {
      images.add(
        await MultipartFile.fromFile(pickedFile[i]!.path,
            filename: pickedFile[i].toString() + ".png"),
      );
    }
    LoginApi.hospitalAttends(
      FormData.fromMap(
        {
          "driver_id": "1",
          "hospital_id": routeByHospitalData?.hospitalId.toString(),
          "time": "2022-08-09 10:00:24",
          "latitude": position?.latitude.toString(),
          "longitude": position?.longitude.toString(),
          "status": status,
          if (pickedFile.isNotEmpty) "photo[]": images
        },
      ),
    ).then((value) {
      setState(() {
        isLoading = false;
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
