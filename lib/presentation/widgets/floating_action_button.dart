import 'package:flutter/material.dart';

class MyFloatingActionButton {
  static Widget floatingActionButton({required void Function()? onPressed,Widget? child,Color? backgroundColor}) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}
