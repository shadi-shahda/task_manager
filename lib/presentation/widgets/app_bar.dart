import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constance/colors.dart';

class MyAppBar{
  static AppBar appBar(Widget title,{Color backGroundColor = lightBlue,bool centerTitle = true}){
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: backGroundColor,
    );
  }
}