import 'package:flutter/material.dart';

class ExtendedChangeNotifier extends ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void setBusy(bool isBusy) {
    _isBusy = isBusy;
    notifyListeners();
  }
}
