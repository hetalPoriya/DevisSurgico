import 'package:driver_apps/api/LoginApi.dart';
import 'package:driver_apps/components_screen/map_screen.dart';
import 'package:driver_apps/confirm/confirm_status.dart';
import 'package:driver_apps/model/Route_by_driver_model.dart';
import 'package:driver_apps/model/Route_by_hospital_model.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class RouteDetail extends StatefulWidget {
  final String? id;
  final String? name;

  const RouteDetail({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<RouteDetail> createState() => _RouteDetailState();
}

class _RouteDetailState extends State<RouteDetail> {
  var document;
  String? inputFormat;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppWidget.appBarWidget(text: 'Route Details'),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: FutureBuilder<RouteByHospitalModel>(
                  future: LoginApi.hospitalRoutes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("Error"));
                    } else if (snapshot.hasData) {
                      print('Snapshot ${snapshot.data?.toJson()}');
                      return (snapshot.data?.status != null)
                          ? ListView.builder(
                              itemCount: snapshot.data!.data?.length,
                              itemBuilder: ((context, index) {
                                document = snapshot.data!.data![index];
                                print('Doucument ${document.date}');
                                DateFormat inputFormat =
                                    DateFormat('dd-MM-yyyy');
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ConfirmStatus(
                                              hospitalName: snapshot
                                                  .data!.data![index].name
                                                  .toString(),
                                              hospitalId: snapshot
                                                  .data!.data![index].hospitalId
                                                  .toString(),
                                              hospitalAddress: snapshot
                                                  .data!.data![index].address
                                                  .toString()),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Material(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.w),
                                              color: AppColors.greyWhite),
                                          height: 21.h,
                                          child: Row(children: [
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 2.h),
                                              child: Align(
                                                child: CircleAvatar(
                                                    backgroundColor: document
                                                                .status ==
                                                            null
                                                        ? Colors.orange.shade600
                                                        : document.status
                                                                    .toString() ==
                                                                'HCF Non-Collected'
                                                            ? Colors.blue
                                                            : document.status
                                                                        .toString() ==
                                                                    'Collected'
                                                                ? Colors.green
                                                                : Colors.red,
                                                    child: Icon(
                                                      Icons.done,
                                                      color: document.status ==
                                                              null
                                                          ? Colors
                                                              .orange.shade600
                                                          : Colors.white,
                                                    )),
                                                alignment: Alignment.topCenter,
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                                  // color: Colors.pink,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(1.w),
                                                    child: Column(
                                                        children: [
                                                          Text(
                                                            document.name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            document.address,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .appBarColor,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                            Icons
                                                                                .calendar_today_rounded,
                                                                            size:
                                                                                8.w,
                                                                            color: Colors.black54),
                                                                        Positioned(
                                                                          bottom:
                                                                              1.w,
                                                                          child: Text(
                                                                              document.date != '' ? DateFormat.d().format(DateTime.now()) : '',
                                                                              style: TextStyle(fontSize: 8.sp)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                      child:
                                                                          Text(
                                                                    document.date.toString() !=
                                                                            ''
                                                                        ? DateFormat.yMMM()
                                                                            .format(DateTime.now())
                                                                        : '',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            8.sp),
                                                                  ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              AppWidget
                                                                  .normalContainer(
                                                                      text:
                                                                          'Take a picture'),
                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              AppWidget
                                                                  .normalContainer(
                                                                      text:
                                                                          'Confirm status'),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          AppWidget
                                                              .normalContainer(
                                                                  text:
                                                                      'View Map',
                                                                  onTap: () =>
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              MapScreen(),
                                                                        ),
                                                                      )),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start),
                                                  ),
                                                ),
                                                flex: 4),
                                            Expanded(
                                              child: Container(
                                                child: Icon(Icons.arrow_right,
                                                    color:
                                                        AppColors.appBarColor,
                                                    size: 14.w),
                                                height: 100.h,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        elevation: 4,
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      )
                                    ],
                                  ),
                                );
                              }))
                          : Center(child: Text('Not Found'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          )),
    );
  }
}
