import 'dart:io';

import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_images.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class AppWidget {
  static AppBar appBarWidget({String? text, PreferredSizeWidget? bottom}) =>
      AppBar(
        centerTitle: true,
        title: Text(text.toString()),
        backgroundColor: AppColors.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
//bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        bottom: bottom,
      );

  static normalContainer({String? text, void Function()? onTap}) => Expanded(
          child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Text(text.toString(),
              style: TextStyle(color: AppColors.appBarColor)),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.appBarColor),
              borderRadius: BorderRadius.circular(1.w)),
          alignment: Alignment.center,
          padding: EdgeInsets.all(1.w),
        ),
      ));

  static Widget cameraWidget({String? text, VoidCallback? onPressed}) =>
      Expanded(
          child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 6.h,
              child: CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                child: Container(
                  width: 100.w,
                  height: 9.h,
                  child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      child: Image.asset(AppImage.camera)),
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text.toString(),
              style: TextStyle(color: Colors.black, fontSize: 10.sp),
            )
          ],
        ),
      ));

  static Widget radioButtonWidget(
          {String? value,
          VoidCallback? onTap,
          Color? color,
          Color? textColor}) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(6.w),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: color ?? AppColors.lightPink,
                  border: Border.all(color: Colors.red.shade100)),
              height: 5.h,
              width: 100.w,
              child: Text(
                value.toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor ?? Colors.red),
                // style: AllTextStyle.smallTextStyle()
                //     .copyWith(fontSize: 10.sp)
              ),
            ),
          ),
        ),
      );

  static Widget textFormField(
          {TextEditingController? textEditingController,
          String? text,
          String? Function(String?)? validator,
          TextInputType? textInputType,
          TextInputAction? textInputAction,
          IconData? iconData,
          Widget? widget,
          bool? obscureText}) =>
      TextFormField(
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.number,
        validator: validator,
        obscureText: obscureText ?? false,
        cursorColor: Colors.grey,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: text.toString(),
          filled: true,
          fillColor: AppColors.textFormFilledColor,
          suffixIcon: widget,
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          ),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(color: AppColors.textFormFilledColor)),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(color: AppColors.textFormFilledColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(color: AppColors.textFormFilledColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(color: AppColors.textFormFilledColor)),
// contentPadding: EdgeInsets.all(6.0),
        ),
      );

  static Widget circularIndicator({required BuildContext context}) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      );

  static getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location permission required');
      await openAppSettings();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    }
  }

  static Widget attendanceWidget(
          {String? currentDate,
          String? currentTime,
          String? currentDay,
          required ImageProvider image,
          VoidCallback? onTap,
          Widget? iconWidget}) =>
      Container(
        height: 18.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: AppColors.lightPink),
        child: Column(
          children: [
            Expanded(
                child: Row(children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: 100.w,
                            height: 100.h,
//color: Colors.red,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: image,
                              ),
                            ),

                            child: Icon(Icons.camera_alt,
                                size: 7.w, color: AppColors.appBarColor),
                          ),
                        ),
                      ),
                      flex: 2),
                  Expanded(
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(PreferencesManager.getString('name'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp)),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text('A-108, city name ,Gwalior',
                                  style:
                                      TextStyle(color: AppColors.appBarColor)),
                            ]),
                      ),
                      flex: 5),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    child: iconWidget,
                  )),
                ]),
                flex: 2),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: AppColors.greyWhite),
                child: Row(children: [
                  Expanded(
                      child: Container(
                    height: 100.h,
                    child: Icon(Icons.calendar_today_outlined,
                        color: Colors.black),
                  )),
                  Expanded(
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentDate.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp)),
                          SizedBox(
                            height: 1.w,
                          ),
                          Text(currentDay.toString(),
                              style: TextStyle(fontSize: 8.sp)),
                        ],
                      )),
                      flex: 4),
                  Expanded(
                      child: Container(
                        height: 100.h,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_filled_sharp,
                                color: AppColors.appBarColor,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                currentTime.toString(),
                                style: TextStyle(fontSize: 9.sp),
                              )
                            ]),
                      ),
                      flex: 2),
                ]),
              ),
              flex: 2,
            )
          ],
        ),
      );

  static Widget submitButton({VoidCallback? onPressed}) => ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, minimumSize: Size(100.w, 6.h)),
      child: Text(
        'Done',
        style: TextStyle(fontSize: 14.sp),
      ));

  static Widget wasteWidget({
    String? text,
    required int noOfBag,
  }) =>
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text.toString(),
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 11.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
              height: 4.h,
              width: 32.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 00),
              alignment: Alignment.centerLeft,
              child: Text(
                noOfBag.toString(),
                overflow: TextOverflow.ellipsis,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  border: Border.all(color: Colors.grey.shade500))),
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   Flexible(
          //     child: TextFormField(
          //         enableInteractiveSelection: false,
          //         onChanged: onChange,
          //         onFieldSubmitted: onFieldSubmitted,
          //         readOnly: true,
          //         controller: numbers,
          //         keyboardType: TextInputType.numberWithOptions(
          //             signed: true, decimal: true),
          //         decoration: InputDecoration(
          //             contentPadding: EdgeInsets.all(1.w),
          //             suffixIconConstraints: BoxConstraints(
          //                 minWidth: 4.w,
          //                 maxHeight: 4.w,
          //                 maxWidth: 4.w,
          //                 minHeight: 4.w),
          //             // suffixIcon: Container(
          //             //   child: Image.asset(
          //             //     AppImage.dropDown,
          //             //     fit: BoxFit.cover,
          //             //     color: Colors.black,
          //             //   ),
          //             // ),
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(2.w),
          //             ),
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(2.w),
          //                 borderSide: BorderSide(
          //                     style: BorderStyle.solid,
          //                     color: Colors.grey.shade500)),
          //             enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(2.w),
          //                 borderSide: BorderSide(
          //                     style: BorderStyle.solid,
          //                     color: Colors.grey.shade500)))),
          //     flex: 2,
          //   ),
          // ])
        ],
      ));

  static Widget taskWidget({String? task, String? hospitalName, String? date}) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date!);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Container(
        height: 10.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: AppColors.greyWhite,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  hospitalName.toString(),
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Row(
                          children: [
                            Flexible(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(Icons.calendar_today_rounded,
                                      size: 8.w, color: Colors.black54),
                                  Positioned(
                                    bottom: 1.w,
                                    child: Text(tempDate.day.toString(),
                                        style: TextStyle(fontSize: 8.sp)),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Text(DateFormat.yMMM().format(tempDate),
                                  style: TextStyle(fontSize: 8.sp)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Flexible(
                              child: Icon(Icons.access_alarms_sharp,
                                  color: AppColors.appBarColor, size: 3.w),
                            ),
                            Flexible(
                              child: Text(
                                  DateFormat("hh:mm a").format(tempDate),
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color: AppColors.appBarColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      flex: 3,
                    ),
                    Flexible(
                        child: Container(
                      width: 20.w,
                      height: 3.h,
                      alignment: Alignment.center,
                      child: Text(task.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.appBarColor, fontSize: 8.sp)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          border: Border.all(color: AppColors.appBarColor)),
                    ))
                  ],
                )
              ]),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       children: [
          //         Align(
          //             alignment: Alignment.topLeft,
          //             child: Text(
          //               data.hospitalId.toString(),
          //               style: const TextStyle(fontWeight: FontWeight.w600),
          //             )),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Align(
          //             alignment: Alignment.topLeft,
          //             child: Text(
          //               data.status.toString(),
          //             )),
          //       ],
          //     ),
          //     const Icon(Icons.camera_alt)
          //   ],
          // ),
        ),
      ),
    );
  }
}
