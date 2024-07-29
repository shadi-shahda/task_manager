import 'package:flutter/material.dart';

pushingScreen(BuildContext context,Widget secondScreen){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => secondScreen),
  );
}

pushingReplacementScreen(BuildContext context,Widget secondScreen){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => secondScreen),
  );
}

popScreen(BuildContext context){
  Navigator.pop(context);
}