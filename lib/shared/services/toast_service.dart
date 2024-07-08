import 'package:flutter/material.dart';
import 'package:mvvm_example_app/app/constants.dart';

class ToastService {
  static final _singleton = ToastService._internal();

  ToastService._internal();

  factory ToastService() => _singleton;

  void showSnackBar(String message) {
    WidgetKey.rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
