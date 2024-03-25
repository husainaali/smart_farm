import 'package:flutter/material.dart';
import 'dart:developer';

class BaseModel extends ChangeNotifier {
  bool? _busy;
  bool get busy => _busy!;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void errorLog(String error, String errorName) => log(
        error,
        name: errorName,
      );
}
