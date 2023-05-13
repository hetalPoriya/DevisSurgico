import 'package:driver_apps/model/Hospital.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../api/LoginApi.dart';
import '../model/Hospital_denied.dart';
import '../model/Hospital_partially_model.dart';

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
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Task'),
              backgroundColor: AppColors.appBarColor,
              elevation: 0,
              bottom: TabBar(
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(fontSize: 10.sp),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(" COLLECTED"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(" HCF Non Collected",
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(" Drop"),
                      ),
                    ),
                  ]),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.w),
              child: TabBarView(children: [done(), partially(), denied()]),
            ),
          )),
    );
    // return Scaffold(
    //   appBar: AppWidget.appBarWidget(text: 'Task'),
    //   // appBar: AppWidget.appBarWidget(
    //   //   text: 'Task',
    //   //   bottom: TabBar(
    //   //     labelColor: Colors.white,
    //   //     unselectedLabelColor: Colors.amberAccent,
    //   //     // isScrollable: true,
    //   //     indicator: BoxDecoration(
    //   //       // borderRadius: BorderRadius.circular(8), // Creates border
    //   //       color: AppColors.appBarColor,
    //   //     ),
    //   //     tabs: [
    //   //       Tab(
    //   //         text: ("Done"),
    //   //       ),
    //   //       Tab(text: ("Partially")),
    //   //       Tab(text: ("Denied")),
    //   //     ],
    //   //   ),
    //   // ),
    //   // appBar: AppBar(
    //   //   centerTitle: true,
    //   //   elevation: 0.0,
    //   //   iconTheme: IconThemeData(color: Colors.black),
    //   //   title: const Text("Task",style: TextStyle(color: Colors.black),),
    //   //   backgroundColor:  Colors.white,
    //   //   bottom: const TabBar(
    //   //     labelColor: Colors.white,
    //   //     unselectedLabelColor: Colors.black,
    //   //    // isScrollable: true,
    //   //     indicator: BoxDecoration(
    //   //       // borderRadius: BorderRadius.circular(8), // Creates border
    //   //         color: AppColots.appBarColor),
    //   //     tabs: [
    //   //       Tab(
    //   //         text: ("Done"),
    //   //       ),
    //   //       Tab(text: ("Partially")),
    //   //       Tab(text: ("Denied")),
    //   //     ],
    //   //   ),
    //   // ),
    //   body: Container(
    //     child: DefaultTabController(
    //         length: 3, // length of tabs
    //         initialIndex: 0,
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 8.w),
    //           child: Column(children: <Widget>[
    //             Expanded(
    //               child: TabBar(
    //                 padding: EdgeInsets.zero,
    //                 labelPadding: EdgeInsets.symmetric(horizontal: 1),
    //                 labelColor: Colors.black,
    //                 indicator: BoxDecoration(
    //                     borderRadius: BorderRadius.only(
    //                         topLeft: Radius.circular(2.w),
    //                         topRight: Radius.circular(2.w)),
    //                     color: Colors.white),
    //                 indicatorColor: Colors.transparent,
    //                 indicatorSize: TabBarIndicatorSize.tab,
    //                 //indicator: BoxDecoration(color: Colors.red),
    //                 unselectedLabelColor: Colors.white,
    //                 unselectedLabelStyle:
    //                     TextStyle(color: Colors.white, fontSize: 10.sp),
    //                 labelStyle: TextStyle(color: Colors.black, fontSize: 10.sp),
    //                 tabs: [
    //                   Container(
    //                       width: 100.w,
    //                       alignment: Alignment.center,
    //                       color: Colors.green,
    //                       child: Tab(
    //                         text: 'COLLECTED',
    //                       )),
    //                   Container(
    //                       width: 100.w,
    //                       alignment: Alignment.center,
    //                       color: Colors.yellow.shade700,
    //                       child: Tab(text: 'HCF Non-Collected')),
    //                   Container(
    //                       width: 100.w,
    //                       alignment: Alignment.center,
    //                       color: Colors.red,
    //                       child: Tab(text: 'Drop')),
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //               flex: 12,
    //               child: TabBarView(children: <Widget>[
    //                 done(),
    //                 partially(),
    //                 denied(),
    //               ]),
    //             )
    //           ]),
    //         )),
    //   ),
    // );
  }

  Future<Hospital> hospitalData() {
    return LoginApi.hospitalData();
  }

  Future<HospitalPartiallyModel> hospitalPartial() {
    return LoginApi.hospitalPartial();
  }

  Future<HospitalDenied> hospitalDenie() {
    return LoginApi.hospitalDenieData();
  }

  Widget addWidget(HospitalData data) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(data.time!);
    // print('Date TIme ${tempDate.day}');
    // print('Date TIme ${tempDate.year}');
    // print('Date 1 ${DateFormat.yMMMM().format(tempDate)}');
    return AppWidget.taskWidget(
        date: data.time!, hospitalName: data.name, task: ' Collected');
  }

  Widget addWidgets(HospitalPartiallyData data) {
    return AppWidget.taskWidget(
        date: data.time!, hospitalName: data.name, task: ' HCF Non-Collected');
    // return Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Card(
    //     color: Colors.cyan,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             children: [
    //               Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                     data.hospitalId.toString(),
    //                     style: const TextStyle(fontWeight: FontWeight.w600),
    //                   )),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                     data.status.toString(),
    //                   )),
    //             ],
    //           ),
    //           const Icon(Icons.camera_alt)
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget addWidgetss(HospitalDeniedData data) {
    return AppWidget.taskWidget(
        date: data.time!, hospitalName: data.name, task: ' Drop');
    // return Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Card(
    //     color: Colors.deepOrangeAccent,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             children: [
    //               Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                     data.hospitalId.toString(),
    //                     style: const TextStyle(fontWeight: FontWeight.w600),
    //                   )),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                     data.status.toString(),
    //                   )),
    //             ],
    //           ),
    //           const Icon(Icons.camera_alt)
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget done() {
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

  Widget partially() {
    return SafeArea(
      child: FutureBuilder(
          future: hospitalPartial(),
          builder: (context, AsyncSnapshot<HospitalPartiallyModel> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...snapshot.data!.data!.map((e) => addWidgets(e)).toList(),
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

  Widget denied() {
    return SafeArea(
      child: FutureBuilder(
          future: hospitalDenie(),
          builder: (context, AsyncSnapshot<HospitalDenied> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...snapshot.data!.data!.map((e) => addWidgetss(e)).toList(),
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
}
