import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/presentation/widgets/alert_dialog.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

showInternetDialog(BuildContext context, onPressed) {
  MyAlertDialog.alertDialog(
    context,
    title: 'something went wrong',
    body: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          MyText.text('internet issue happened',
              fontSize: 16, textColor: black),
          MyText.text('please try again',
              fontSize: 16, textColor: black),
        ],
      ),
    ),
    firstButton:'exit',
    firstPressed:() {
      SystemNavigator.pop();
    },
    secondButton: 'try again',
    secondPressed: onPressed,
  );
}

errorDialog(BuildContext context, onPressed, {required List<Widget> errorMessages}){
  MyAlertDialog.alertDialog(
    context,
    title: 'something went wrong',
    body: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: errorMessages,
      ),
    ),
    secondButton: 'try again',
    secondPressed: onPressed,
  );
}