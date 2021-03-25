

import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier {
  String phone;
  String email;
  String name;
  String companyName;
  String location;

  setInfo(e, n, cN, loc) {
    email = e;
    name = n;
    companyName = cN;
    location = loc;
    notifyListeners();
  }
}
