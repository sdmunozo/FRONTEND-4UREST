import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String brand = '';
  String branch = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  validateForm() {

    if ( formKey.currentState!.validate() ) {
      //print('Form valid ... Login');
      //print('$brand === $branch === $firstName === $lastName === $email === $password');
      return true;
    } else {
      //print('Form not valid');
      return false;
    }

  }

}