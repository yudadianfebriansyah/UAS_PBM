import 'package:flutter/cupertino.dart';

class PasswordProvider extends ChangeNotifier {
  bool _viewpw = false;
  bool get viewpw => _viewpw;

  passwordview() {
    _viewpw = !viewpw;
    notifyListeners();
  }
}
