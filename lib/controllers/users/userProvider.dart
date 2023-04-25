import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetConnect {
  final url = "https://balikencana-dev.com";

  Future<Response> postData(
      String id, String name, String email, String phone) {
    try {
      final body = jsonEncode({
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
      });

      return post(url, body);
    } catch (Exc) {
      print(Exc);
      rethrow;
    }
  }
}
