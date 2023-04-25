import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUsers {
  GoogleSignInAccount? _currentUserslogin;
  Color primary = Color.fromARGB(255, 19, 183, 195);

  String devUrl = "http://192.168.99.179:8000/api";
  //String devUrl = "https://mini-inventory.balikencana-dev.com/api";

  set SetcurrentUserslogin(GoogleSignInAccount? _currentUsersloginValue) {
    _currentUserslogin = _currentUsersloginValue;
  }

  get GetcurrentUserslogin {
    _currentUserslogin == null ? "" : _currentUserslogin!.email.toString();
  }
}
