import 'package:driver_apps/api/LoginApi.dart';
import 'package:driver_apps/components_screen/map_screen.dart';
import 'package:driver_apps/components_screen/route_details_screens.dart';
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

class RouteDataList extends StatefulWidget {
  final String? id;
  final String? name;

  const RouteDataList({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<RouteDataList> createState() => _RouteDataListState();
}

class _RouteDataListState extends State<RouteDataList> {
  var document;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppWidget.appBarWidget(text: 'Routes'),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: FutureBuilder<RouteByDriverModel>(
                  future: LoginApi.driverRoutes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("Error"));
                    } else if (snapshot.hasData) {
                      return (snapshot.data?.status != null)
                          ? ListView.builder(
                              itemCount: snapshot.data!.data?.length,
                              itemBuilder: ((context, index) {
                                document = snapshot.data!.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    PreferencesManager.setInt(
                                            AppStrings.routeByDriverId,
                                            document.id)
                                        ?.then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RouteDetail(),
                                            )));
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
                                          height: 8.h,
                                          alignment: Alignment.center,
                                          child: Text(
                                            document.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
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
