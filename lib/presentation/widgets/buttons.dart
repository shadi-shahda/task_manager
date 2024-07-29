import 'package:flutter/material.dart';

class MyButtons {
  static Widget primaryButton(void Function()? onPressed, Widget child, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
      child: child,
    );
  }
}
