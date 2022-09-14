import 'package:driver_apps/model/Hospital.dart';
import 'package:flutter/material.dart';

import '../api/LoginApi.dart';

class TaskCompleteSCreen extends StatefulWidget {
  final String? id;
  final String? name;

  const TaskCompleteSCreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<TaskCompleteSCreen> createState() => _TaskCompleteSCreenState();
}

class _TaskCompleteSCreenState extends State<TaskCompleteSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Complete"),
        backgroundColor: const Color(0XFFB71C1C),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              //bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: hospitalData(),
            builder: (context, AsyncSnapshot<Hospital> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...snapshot.data!.data!.map((e) => addWidget(e)).toList(),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<Hospital> hospitalData() {
    return LoginApi.hospitalData();
  }

  Widget addWidget(HospitalData data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.hospitalId.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.status.toString(),
                      )),
                ],
              ),
              const Icon(Icons.camera_alt)
            ],
          ),
        ),
      ),
    );
  }
}
