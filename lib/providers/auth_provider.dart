import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password){
    //Peticion HTTP

    _token = 'ASADSAdsadadsadas.dasdas';
    // ignore: avoid_print
    print('Token $_token');

    //Navegar a dashBoard

    notifyListeners();
  }

}