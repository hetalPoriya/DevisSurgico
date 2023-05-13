// ignore_for_file: unused_import, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String? id;
  final String? name;
  const Profile({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
  int selectedIndex = 0;
  Map data = {
    'name':'Abcd',
    'birthday':'12-08-2000',
    'email':'abcd@gmail.com',
    'mobile':'1234567890',
    'vehicle':'123456',
  };

  bool isTextFieldEnabled = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vehicleNumberController = TextEditingController();

  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nameController.text = data['name'];
      _birthdayController.text = data['birthday'];
      _emailController.text = data['email'];
      _contactController.text = data['mobile'];
      _vehicleNumberController.text = data['vehicle'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor:  AppColors.appBarColor,
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decorationThickness: 2.0,
                decorationStyle: TextDecorationStyle.solid,
                wordSpacing: 10,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      offset: Offset(3, 1))
                ]),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CustomPaint(
                    child: Container(
                      height: 150,
                    ),
                    painter: HeaderCurvedContainer(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: 130,
                        height: 130,
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
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/profile.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 110,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: AppColors.appBarColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() => isTextFieldEnabled = true);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 25, right: 15),
                    child: Column(
                      children: [
                        TextField(
                          readOnly: !isTextFieldEnabled,
                          controller: _nameController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:  Icon(
                              Icons.person,
                              color: AppColors.appBarColor,
                              size: 28,
                            ),
                            //prefixIconColor: const Color(0XFFaeca53),
                            hintText: data['name'],
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          readOnly: !isTextFieldEnabled,
                          controller: _birthdayController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:  Icon(
                              Icons.calendar_month,
                              color: AppColors.appBarColor,
                              size: 28,
                            ),
                            // prefixIconColor: const Color(0XFFaeca53),
                            hintText: data['birthday'],
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          readOnly: !isTextFieldEnabled,
                          controller: _contactController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:  Icon(
                              Icons.phone_android_outlined,
                              color: AppColors.appBarColor,
                              size: 28,
                            ),
                            //prefixIconColor: const Color(0XFFaeca53),
                            hintText: data['Mobile No.'],
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          readOnly: !isTextFieldEnabled,
                          controller: _emailController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:  Icon(
                              Icons.email_outlined,
                              color: AppColors.appBarColor,
                              size: 28,
                            ),
                            // prefixIconColor: const Color(0XFFaeca53),
                            hintText: data['E-mail'],
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                        readOnly: !isTextFieldEnabled,
                          controller: _vehicleNumberController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:  Icon(
                              Icons.car_repair,
                              color: AppColors.appBarColor,
                              size: 28,
                            ),
                            // prefixIconColor: const Color(0XFFaeca53),
                            hintText:  data['vehicle'],
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, right: 50),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                child: const Text(
                                  "Save",
                                  style: TextStyle(fontSize: 12),
                                ),
                                onPressed: () {
                                  log(_emailController.text);
                                  log(_nameController.text);
                                  log(_vehicleNumberController.text);
                                  log(_birthdayController.text);
                                  log(_contactController.text);
                                  if (_emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please Enter Email Id')));
                                  } else if (_nameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please Enter Name')));
                                  } else if (_birthdayController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please Enter Birthday')));
                                  } else if (_contactController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please Enter Mobile No.')));
                                  } else if (_vehicleNumberController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please Enter Vehicle No.')));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  primary: AppColors.appBarColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color =  AppColors.appBarColor;
    Path path = Path()
      ..relativeLineTo(0, 80)
      ..quadraticBezierTo(size.width / 2, 150, size.width, 80)
      ..relativeLineTo(0, -137)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
