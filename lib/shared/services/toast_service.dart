import 'package:flutter/material.dart';
import 'package:mvvm_example_app/app/constants.dart';

class ToastService {
  static final _singleton = ToastService._internal();

  ToastService._internal();

  factory ToastService() => _singleton;

  void showSnackBar(String message, [Color? textColor]) {
    WidgetKey.rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
