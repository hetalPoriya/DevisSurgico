import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FormValidation {
  static String? Function(String?)? mobileNumberValidation({String? value}) =>
      (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter user name';
        }else if(!GetUtils.isPhoneNumber(value)){
          return 'Please enter valid contactNo';
        }
      };

  static String? Function(String?)? passwordValidation({String? value}) =>
      (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
      };
}
