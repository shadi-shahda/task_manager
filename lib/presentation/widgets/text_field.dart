import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constance/colors.dart';

class MyTextField {
  static Widget textField(
    controller, {
    TextAlign? textAlign,
    TextInputType? type,
    bool obscure = false,
    Color textColor = white,
    Widget? prefixIcon,
    String? hint,
  }) {
    return TextField(
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      keyboardType: type,
      style: TextStyle(color: textColor),
      obscureText: obscure,
      decoration: InputDecoration(
        fillColor: white,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintStyle: TextStyle(fontSize: 16, color: grey.withOpacity(0.5)),
        prefixIcon: SizedBox(
          height: 15,
          width: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: prefixIcon,
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}
