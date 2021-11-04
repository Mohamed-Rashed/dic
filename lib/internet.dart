import 'package:flutter/cupertino.dart';

class CheckInternet extends ChangeNotifier{

  bool _isOnline = true;
  bool _isExists = false;

  bool get isExists => _isExists;

  set isExists(bool value) {
    _isExists = value;
    notifyListeners();
  }

  bool get isOnline => _isOnline;

  set isOnline(bool value) {
    _isOnline = value;
    notifyListeners();
  }
}