import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:driver_apps/model/collection_model.dart';
import 'package:driver_apps/model/get_hospital_attend_model.dart';
import 'package:driver_apps/model/waste_model.dart';
import 'package:collection/collection.dart';
import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';
import 'package:driver_apps/api/LoginApi.dart';
import 'package:driver_apps/home_screen/home.dart';
import 'package:driver_apps/model/Route_by_hospital_model.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ConfirmStatus extends StatefulWidget {
  String hospitalName;
  String hospitalId;
  String hospitalAddress;

  ConfirmStatus(
      {Key? key,
      required this.hospitalName,
      required this.hospitalId,
      required this.hospitalAddress})
      : super(key: key);

  @override
  State<ConfirmStatus> createState() => _ConfirmStatusState();
}

class _ConfirmStatusState extends State<ConfirmStatus> {
  RouteByHospitalData? routeByHospitalData;
  String statusString = '';
  bool isLoading = false;
  Position? position;

  String _scanBarcode = 'Unknown';
  GetHospitalAttendModel? getHospitalAttendModel = GetHospitalAttendModel();
  List<int> bags = [0, 0, 0, 0];
  List<double> weights = [0.0, 0.0, 0.0, 0.0];

  CollectionModel collectionModel = CollectionModel();

  // List<PickedFile?> pickedFile = [];
  List<XFile?> pickedFile = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController commentCon = TextEditingController();

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    getBagAndWeight();
    super.initState();
  }

  getBagAndWeight() async {
    var dateTime = DateTime.now();
    var outputFormat = DateFormat('yyyy-MM-dd');

    var formatDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      isLoading = true;
    });
    getHospitalAttendModel = await LoginApi.getHospitalAttendModel(
            hospital_id: widget.hospitalId,
            from_time: formatDate,
            to_time: formatDate)
        .then((value) {
      setState(() {
        getHospitalAttendModel = value;
        print('Model ${getHospitalAttendModel?.data}');

        if (getHospitalAttendModel!.data!.isNotEmpty) {
          collectionModel = CollectionModel.fromJson(
              jsonDecode(value.data!.last.collection.toString()));
          bags = [
            int.parse(collectionModel.red!.bag.toString()),
            int.parse(collectionModel.yellow!.bag.toString()),
            int.parse(collectionModel.blue!.bag.toString()),
            int.parse(collectionModel.white!.bag.toString()),
          ];
          weights = [
            double.parse(collectionModel.red!.weight.toString()),
            double.parse(collectionModel.yellow!.weight.toString()),
            double.parse(collectionModel.blue!.weight.toString()),
            double.parse(collectionModel.white!.weight.toString()),
          ];
          print('Bags $bags');
          print('Bags $weights');
        }

        isLoading = false;
      });
    });
  }

  List<WasteModel> listOfWaste = [
    WasteModel(
        bags: 0,
        // kgs: 0.0,
        colorName: 'RED',
        color: AppColors.lightPink,
        colorBorder: Colors.red.shade200),
    WasteModel(
        bags: 0,
        // kgs: 0.0,
        colorName: 'YELLOW',
        color: Colors.yellow.shade100,
        colorBorder: Colors.yellow.shade400),
    WasteModel(
        bags: 0,
        // kgs: 0.0,
        colorName: 'BLUE',
        color: Colors.blue.shade50,
        colorBorder: Colors.blue.shade200),
    WasteModel(
        bags: 0,
        // kgs: 0.0,
        colorName: 'WHITE',
        color: Colors.white,
        colorBorder: Colors.grey.shade400),
  ];

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal({required int index}) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // var result = await BarcodeScanner.scan();
      // print('RESULT $result');
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.BARCODE,
      ).then((value) {
        setState(() {
          print('barcodeScanRes ${value}');
          Fluttertoast.showToast(
              msg: 'BarCode : $value', toastLength: Toast.LENGTH_LONG);
          bags[index] = bags[index] + 1;

          print('Compelte Barcode $value');
          double getWeight =
              double.parse(value.toString().substring(value.length - 5));
          log('Get Only Weight ${value}');
          log('Get Only Weight ${value.toString().substring(value.length - 5)}');
          log(getWeight.toString());
          getWeight = getWeight / 1000;
          print('Original Weight $getWeight');
          weights[index] = weights[index] + getWeight;
          // totalWeight = totalWeight + getWeight;
          // totalWeight = () ;
        });
        return value;
      });
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    //
    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    //   print(_scanBarcode);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppWidget.appBarWidget(text: 'Confirm status'),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.hospitalName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 38.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: Colors.grey.shade100,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      child: GridView.builder(
                          itemCount: listOfWaste.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.w,
                                  crossAxisSpacing: 4.w,
                                  childAspectRatio: 4 / 3),
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () => scanBarcodeNormal(index: index),
                              child: Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                    color: listOfWaste[index].color,
                                    borderRadius: BorderRadius.circular(6.w),
                                    border: Border.all(
                                        color: listOfWaste[index].colorBorder)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listOfWaste[index].colorName,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      AppWidget.wasteWidget(
                                        text: 'Bags:',
                                        noOfBag: bags[index],

                                        // onFieldSubmitted: (value) {
                                        //   setState(() {
                                        //     totalBags =
                                        //         listOfWaste[0].bags +
                                        //             listOfWaste[1].bags +
                                        //             listOfWaste[2].bags +
                                        //             listOfWaste[3].bags;
                                        //   });
                                        // },
                                      ),
                                    ]),
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('Today’s waste received',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.calendar_today_rounded,
                                    size: 8.w, color: Colors.black54),
                                Positioned(
                                  bottom: 1.w,
                                  child: Text(
                                      DateFormat.d().format(DateTime.now()),
                                      style: TextStyle(fontSize: 8.sp)),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat.yMMM().format(DateTime.now()),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 8.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 5.h,
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          color: AppColors.appBarColor),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text(
                              // 'Total Qty: ${listOfWaste[0].bags + listOfWaste[1].bags + listOfWaste[2].bags + listOfWaste[3].bags} Bags',
                              'Total Qty: ${bags.sum} Bags',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.sp),
                            )),
                            FittedBox(
                              child: Text(
                                'Total Weight: ${weights.sum.toStringAsFixed(3)} Kg',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select Status',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.w),
                                color: AppColors.lightPink,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidget.radioButtonWidget(
                                      value: 'Collected',
                                      color: statusString == 'Collected'
                                          ? AppColors.appBarColor
                                          : AppColors.lightPink,
                                      textColor: statusString == 'Collected'
                                          ? Colors.white
                                          : AppColors.appBarColor,
                                      onTap: () {
                                        setState(() {
                                          statusString = 'Collected';
                                        });
                                      }),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  AppWidget.radioButtonWidget(
                                      value: 'HCF Non-Collected',
                                      color: statusString == 'HCF Non-Collected'
                                          ? AppColors.appBarColor
                                          : AppColors.lightPink,
                                      textColor:
                                          statusString == 'HCF Non-Collected'
                                              ? Colors.white
                                              : AppColors.appBarColor,
                                      onTap: () {
                                        setState(() {
                                          statusString = 'HCF Non-Collected';
                                        });
                                      }),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  AppWidget.radioButtonWidget(
                                      value: 'Drop',
                                      color: statusString == 'Drop'
                                          ? AppColors.appBarColor
                                          : AppColors.lightPink,
                                      textColor: statusString == 'Drop'
                                          ? Colors.white
                                          : AppColors.appBarColor,
                                      onTap: () {
                                        setState(() {
                                          statusString = 'Drop';
                                        });
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (pickedFile.isNotEmpty)
                      Wrap(
                        runSpacing: 2.w,
                        spacing: 2.w,
                        direction: Axis.horizontal,
                        children: pickedFile
                            .map(
                              (e) => Container(
                                height: 12.h,
                                width: 24.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.w),
                                  child: Image.file(
                                    fit: BoxFit.fill,
                                    File(e!.path),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    if (pickedFile.isNotEmpty)
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState
                            ?.showBottomSheet((context) => Container(
                                  width: 100.w,
                                  height: 10.h,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _openCamera();
                                          },
                                          icon: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.white,
                                            size: 8.w,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _openGallery();
                                          },
                                          icon: Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 8.w,
                                          ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.w),
                                      color: AppColors.appBarColor),
                                )),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                width: 30.w,
                                height: 10.h,
                                alignment: Alignment.center,
                                child: Text('Add more + '),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.w),
                                    color: AppColors.greyWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (pickedFile.isEmpty)
                      Row(
                        children: [
                          AppWidget.cameraWidget(
                              text: 'Take a picture', onPressed: _openCamera),
                          AppWidget.cameraWidget(
                              text: 'Add from gallery', onPressed: _openGallery)
                        ],
                      ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          border: Border.all(color: AppColors.appBarColor)),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: null,
                        controller: commentCon,
                        decoration: InputDecoration(
                            hintText: 'Add Comment',
                            contentPadding: EdgeInsets.all((2.w)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            if (pickedFile.isNotEmpty &&
                                statusString.isNotEmpty) {
                              print(
                                  '  listOfWaste[index].kgs ${listOfWaste[0].kgs}');
                              addServices();
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      'Please add  one picture and any status');
                            }
                          },
                          child:
                              Text('Submit', style: TextStyle(fontSize: 14.sp)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size(100.w, 6.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.w)),
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ]),
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
    position = await AppWidget.getCurrentLocation();
    setState(() {
      this.position = position;
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
          "driver_id": PreferencesManager.getString(AppStrings.userId),
          "hospital_id": widget.hospitalId,
          // "time": "2022-08-09 10:00:24",
          "time": DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
          "latitude": position?.latitude.toString(),
          "longitude": position?.longitude.toString(),
          'location': widget.hospitalAddress,
          "status": statusString,
          "r_bag": bags[0],
          "r_weight": weights[0],
          "y_bag": bags[1],
          "y_weight": weights[1],
          "b_bag": bags[2],
          "b_weight": weights[2],
          "w_bag": bags[3],
          "w_weight": weights[3],
          'comment': commentCon.text ?? '',
          if (pickedFile.isNotEmpty) "photo[]": images
        },
      ),
    ).then((value) {
      setState(() {
        isLoading = false;
        PreferencesManager.setStringListPref(
          AppStrings.bagList,
          bags.map((e) => e.toString()).toList(),
        );
        PreferencesManager.setStringListPref(
          AppStrings.weightList,
          weights.map((e) => e.toString()).toList(),
        );

        print(PreferencesManager.getStringListPref(AppStrings.bagList));
        print(PreferencesManager.getStringListPref(AppStrings.weightList));
        Fluttertoast.showToast(msg: 'Successfully submitted.');
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    // }
  }

  void _openCamera() {
    final picker = ImagePicker();

    picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    pickedFile.add(value);
                  })
                }
            });
  }

  void _openGallery() {
    final picker = ImagePicker();

    picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    pickedFile.add(value);
                  })
                }
            });
  }
}
