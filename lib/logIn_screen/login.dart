import 'dart:developer';

import 'package:driver_apps/home_screen/home.dart';
import 'package:flutter/material.dart';

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
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
             const SizedBox(
              height: 10,
            ),
            const Text(
              "Login",
              style: TextStyle(
                color: Color(0XFFB71C1C),
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
            const SizedBox(
              height:50,
            ),
            SizedBox(
              height: 200,
              child: Image.asset("assets/splash.jpg",

              ),
            ),
            const SizedBox(
              height:40,
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      //color:  const Color(0XFFC5E1A5),
                      color:  const Color(0XFFFFCDD2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (value.trim().length < 16) {
                          return 'Please enter your valid number';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      controller: _numberController,
                      decoration: const InputDecoration(
                        hintText: "Your number",
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.all(6.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                       color: const Color(0XFFFFCDD2),
                     // color: const Color(0XFFC5E1A5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.trim().length < 6) {
                          return 'Please enter your valid password';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          hintText: "Your Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: InkWell(
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
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        primary:const Color(0XFFB71C1C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ]),
        ),
      ),
    );
  }
   void signIn() {
     if (_numberController.text == "") {
       _showMyDialog();
     } else if (_passwordController.text == "") {
       _showMyDialog();
     } else {
       var loginResponse = LoginApi.logIn({
         "mobile": _numberController.text,
         "password": _passwordController.text
       });
       loginResponse.then((value) async {
         log("helllllllo");
         log(value.mobile.toString());
         if (value.mobile != null) {
           prefs!.setBool("islogin", true);
           prefs!.setString("id", value.id.toString());
           prefs!.setString("name", value.name.toString());
           prefs!.setString("mobile", value.mobile.toString());
           prefs!.setString("password", value.password.toString());
           prefs!.setString("device_id", value.deviceId.toString());
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
     }
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
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
}
