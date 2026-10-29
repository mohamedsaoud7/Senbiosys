import 'package:flutter/foundation.dart';

class PasswordProvider extends ChangeNotifier {
  String _password = '';
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(_password);
  bool get hasNumber => RegExp(r'[0-9]').hasMatch(_password);
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(_password);
  bool get hasSpecialCharacter => RegExp(r'[^A-Za-z0-9\s]').hasMatch(_password);
  bool get hasMinimumLength => _password.length >= 8;

  bool get isValid =>
      hasLowercase &&
      hasNumber &&
      hasUppercase &&
      hasSpecialCharacter &&
      hasMinimumLength;

  int get score {
    int result = 0;

    if (hasLowercase) result++;
    if (hasNumber) result++;
    if (hasUppercase) result++;
    if (hasSpecialCharacter) result++;
    if (hasMinimumLength) result++;

    return result;
  }

  String get strengthLabel {
    if (score <= 1) return 'Weak';
    if (score == 2) return 'Fair';
    if (score == 3) return 'Good';
    if (score == 4) return 'Strong';
    return 'Great';
  }

  void updatePassword(String value) {
    if (_password == value) return;
    _password = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
