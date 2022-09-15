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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
        length: 3,
        child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("Task Complete",style: TextStyle(color: Colors.black),),
        backgroundColor:  Colors.white,
        bottom: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
         // isScrollable: true,
          indicator: BoxDecoration(
            // borderRadius: BorderRadius.circular(8), // Creates border
              color: Color(0XFFB71C1C)),
          tabs: [
            Tab(
              text: ("Done"),
            ),
            Tab(text: ("Partially")),
            Tab(text: ("Denied")),
          ],
        ),
      ),
          body: TabBarView(
            children: [
             done(),
              partially(),
              denied(),
            ],
          ),

    )));
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
 Widget done(){
    return SafeArea(
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
        );
 }
  Widget partially(){
    return Container();
  }
  Widget denied(){
    return Container();
  }
}
