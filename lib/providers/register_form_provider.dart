import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String brand = '';
  String branch = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  set updateBrand(String value) {
    brand = value;
    notifyListeners();
  }

  set updateBranch(String value) {
    branch = value;
    notifyListeners();
  }

  set updateFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  set updateLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  set updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  set updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  set updateConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }
}
