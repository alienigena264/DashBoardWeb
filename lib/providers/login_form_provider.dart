
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


bool validateForm() {
  return formKey.currentState!.validate();
}

}
