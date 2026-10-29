import 'package:flutter/foundation.dart';

class CreateAccountProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  String day = '';
  String month = '';
  String year = '';
  String height = '';

  String get birthDate => '$day/$month/$year';

  void saveEmail(String value) {
    email = value;
    notifyListeners();
  }

  void savePassword(String value) {
    password = value;
    notifyListeners();
  }

  void saveDay(String value) {
    day = value;
    notifyListeners();
  }

  void saveMonth(String value) {
    month = value;
    notifyListeners();
  }

  void saveYear(String value) {
    year = value;
    notifyListeners();
  }

  void saveHeight(String value) {
    height = value;
    notifyListeners();
  }
}
