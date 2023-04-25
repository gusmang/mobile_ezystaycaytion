import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MemberListController extends GetxController {
  var user_fullname = "".obs;
  var user_deviceToken = "".obs;
  var user_id = "".obs;

  setMemberList(var str) => user_fullname.value = str;
  setDeviceToken(var str) => user_deviceToken.value = str;
  setUserId(var index) => user_id.value = index;
}
