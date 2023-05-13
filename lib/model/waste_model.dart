import 'package:flutter/material.dart';

class WasteModel {
  String colorName;
  int bags;
  double? kgs;
  Color color;
  Color colorBorder;

  WasteModel(
      {this.kgs,
      required this.bags,
      required this.colorName,
      required this.color,
      required this.colorBorder});
}
