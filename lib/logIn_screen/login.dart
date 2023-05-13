import 'dart:developer';

import 'package:driver_apps/home_screen/home.dart';
import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_strings.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:driver_apps/utils/sharedPref_.dart';
import 'package:driver_apps/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../api/LoginApi.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool isLoading = false;
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.appBarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Image.asset(
                      "assets/splash.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                    key: _form,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        children: [
                          AppWidget.textFormField(
                            text: 'Your number',
                            textEditingController: _numberController,
                            validator: FormValidation.mobileNumberValidation(
                                value: _numberController.text),
                            iconData: Icons.call,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppWidget.textFormField(
                            text: 'Your Password',
                            textEditingController: _passwordController,
                            validator: FormValidation.passwordValidation(
                                value: _passwordController.text),
                            widget: InkWell(
                              onTap: () => setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              }),
                              child: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            iconData: Icons.lock,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 80),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_form.currentState!.validate()) {
                                  signIn();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Invalid credential');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.appBarColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            if (isLoading == true)
              Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ))
          ],
        ),
      ),
    );
  }

  signIn() {
    // if (_numberController.text == "") {
    //   _showMyDialog();
    // } else if (_passwordController.text == "") {
    //   _showMyDialog();
    // } else {
    setState(
      () => {isLoading = true},
    );
    var loginResponse = LoginApi.logIn({
      "mobile": _numberController.text,
      "password": _passwordController.text
    });
    loginResponse.then((value) async {
      log("helllllllo");
      log(value.mobile.toString());
      if (value.mobile != null) {
        print('value ${value.id}');
        PreferencesManager.setBool(AppStrings.islogin, true);
        PreferencesManager.setString(AppStrings.userId, value.id.toString());
        PreferencesManager.setString(AppStrings.name, value.name.toString());
        PreferencesManager.setString(
            AppStrings.mobile, value.mobile.toString());
        PreferencesManager.setString(
            AppStrings.password, value.password.toString());
        PreferencesManager.setString(
            AppStrings.device_id, value.deviceId.toString());
        PreferencesManager.setInt(AppStrings.onlyCurrentDate, 0);
        PreferencesManager.setBool(AppStrings.isAttendanceIn, false);
        log(value.toString());
        setState(
          () => {isLoading = false},
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
          ),
        );
      } else {
        _showMyDialog();
      }
    });
    // }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Invalid credentials. Please try again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  isLoading = false;
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
